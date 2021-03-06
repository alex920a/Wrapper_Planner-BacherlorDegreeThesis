#include "ros/ros.h"
#include "std_msgs/String.h"
#include "nav_msgs/OccupancyGrid.h"
#include <cstdio>
#include "ros/console.h"
#include <sstream>
#include "nav_msgs/MapMetaData.h"
#include "map_msgs/OccupancyGridUpdate.h"
#include "stdio.h"
#include "stdlib.h"

#include <sys/time.h>
#include <iostream>
#include <fstream> //header necessario per ofstream!
#include <tf/transform_listener.h>
#include <wrapper_planner/Functions.h>
#include <wrapper_planner/planner.h>
#define EPSILON_ROT 0.5
//#define EPSILON_LIN 0.03 per risoluzione a 0.5
#define EPSILON_LIN 0.01  //per risoluzione a 0.3
#define PI 3.14159
using namespace std;


std::vector<int> primitive;
std::vector<int> percorso;
nav_msgs::OccupancyGrid mappe; // il puntatore al messaggio mappa (i valori vengono aggiornati automaticamente)

map_msgs::OccupancyGridUpdate::ConstPtr updates;
ros::Publisher cmd_vel_pub_;
int sizemap;
int width,height;
float resolution;
unsigned char *mappaStorica;
unsigned char *mappaNuova;

Planner p1;
int target_x,target_y;
int cell_x,cell_y;

//funzioni
void mapCallback(const nav_msgs::OccupancyGrid::ConstPtr& map);
void Action(nav_msgs::OccupancyGrid mappe);




void AllineaRobot(int gradi)
{
	bool allineato=false;
	
	//prendo il tf del base_link 
	tf::TransformListener listener;
	//ros::Rate rate(10);
	tf::StampedTransform transform;

	try
	{
		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(1.5) );
		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());

	} 
	
	double start_angle=(tf::getYaw(transform.getRotation())*180)/PI; //angolo di partenza
	
	
	 
	if(start_angle<0)
		start_angle+=360; //trasformo tutti in positivo	
	//printf("start angle (gradi):%f\n",start_angle);	


        while(!allineato)
        {
            try
	    {
		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(1.5) );
		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
	    }
	    catch (tf::TransformException ex)
	    {
		ROS_ERROR("Nope! %s", ex.what());
		//ros::Duration(0.5).sleep();
	    } 
	    
	    double angolo_current=(tf::getYaw(transform.getRotation())*180)/PI;
	   
	    if(angolo_current<0)
	    	angolo_current+=360;


	    double final=gradi-angolo_current;
	   // printf("Destination angle:%f, current angle:%f\n",destinationAngleRad,angolo_current);
//	    printf("differenza: %f\n",final);    
	    
	   
	        
	    if(abs(final)<=EPSILON_ROT)
	    {
	  	allineato=true;
	    	//printf("Allineato!\n");
	    }	 
	    else
	    {
	    	//mando un comando di rotazione
	    	allineato=false;
	    	geometry_msgs::Twist cmd_rot;
	    	
	    	if(final<-180) //ruotiamo in base alla primitiva segnalata
	    	{
	    		//printf("ruota verso sx!\n");
	    		cmd_rot.angular.z=0.3;
	    	}	
	    	else if(final>=180)
	    	{
	    		//printf("ruota verso dx!\n");
	    		cmd_rot.angular.z=-0.3;
	    	}
	    	else if(final>0)
	    	{
	    		//printf("ruota verso sx!\n");
	    		cmd_rot.angular.z=0.3;
	    	}
	    	else if(final<=0)	
	    	{
	    		//printf("ruota verso dx!\n");
	    		cmd_rot.angular.z=-0.3;
	    	}	
	    	cmd_vel_pub_.publish(cmd_rot);
	    }
	    //ros::Duration(0.1).sleep();	  //aumentare il time se vogliamo renderlo piu lento 
        }
        
     //   rate.sleep();
}


void AvanzaCasella(int gradi)
{
	bool avanzamento=false;
	tf::TransformListener listener;
	//ros::Rate rate(10);
	tf::StampedTransform transform;

	double start_x; //coordinate di start del robot nella casella corrente
    double start_y;
	double destination_x;
	double destination_y;
	double dist,diff;
	
	geometry_msgs::Twist cmd_lin;
	        
        try
	{
		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(1.5) );
		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());
		ros::Duration(1.0).sleep();

	} 
	    
	start_x=transform.getOrigin().x();
	start_y=transform.getOrigin().y();
	//ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
	//printf("Parto dalla casella: [%d,%d] e devo arrivare in [%d,%d]\n",cell_x,cell_y,target_x, target_y);

	 while(!avanzamento)
	 {
	    try
	    {
		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(1.5) );
		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
	    }
	    catch (tf::TransformException ex)
	    {
		ROS_ERROR("Nope! %s", ex.what());
		ros::Duration(1.0).sleep();
	    } 
	    
	     destination_x=transform.getOrigin().x();
	     destination_y=transform.getOrigin().y();


	     dist=sqrt((destination_x-start_x)*(destination_x-start_x) + (destination_y-start_y)*(destination_y-start_y));
	     if(gradi== 90 || gradi == -90 || gradi== 180 || gradi == 0) 
	     		diff=dist-resolution; //movimenti ortogonali
	     else
	     		diff=dist-sqrt(2)*resolution; //movimenti diagonali
	     	
	     //printf("start_x=%f, start_y=%f, destination_x=%f, destination_y=%f\n",start_x,start_y,destination_x,destination_y);
	     //printf("differenza: %f\n",diff);

	     if(abs(diff)<=EPSILON_LIN)
	     {
	     	avanzamento=true;
	     	//printf("avanzamento di cella completato!\n");
	     	ReturnCoordinateCells(&cell_x, &cell_y,destination_x,destination_y,mappe);
	     }	 
	     else
	     {
	    	//mando un comando di traslazione
	    	//printf("trasla ancora!\n");
	    	cmd_lin.linear.x=0.2;	
	        cmd_vel_pub_.publish(cmd_lin);
	    	avanzamento=false;
	     }		
	     //ros::Duration(0.1).sleep();   //aumentare il time se vogliamo renderlo piu lento 
	 }    
}

void MovimentoRobot(int gradi)
{
 	 ros::NodeHandle nh_;
  	cmd_vel_pub_=nh_.advertise<geometry_msgs::Twist>("/husky/cmd_vel",1);
  	
  	//rotazione robot finche non è allineato nella direzione dove deve andare
  	AllineaRobot(gradi);
  	
  	//avanzamento casella (ogni casella è un quarto della cella grande che si vede dentro. Ogni casella vale 0.5m)
  	AvanzaCasella(gradi);
}


 //conversione delle primitive perche la mappa del simulatore è ruotata di 180 rispetto a quella delle libreria planner
void AzioneByNamePrimitiva(int primitiva)  
{
	int gradi=-1;	
		
	gradi=RiconosciPrimitiva(primitiva);	
	if(gradi!=-1)
		MovimentoRobot(gradi);				
}



void MuoviRobot(vector<int> primitive)
{
	int i=0;
	//prima di far partire il loop per ogni primitiva popolo il vettore percorso con dentro le  coordinate delle caselle da attraversare
	PopolaPercorso(primitive, percorso,cell_y,cell_x);

	while(i<primitive.size())
	{
		//printf("primitiva in lavorazione: %d\n",primitive.at(i));
		AzioneByNamePrimitiva(primitive.at(i));
		printf("Arrivato alla cella [%d,%d]. Devo arrivare in [%d,%d]\n",cell_y,cell_x,target_x,target_y);
		//aggiorno la mappa nuova
		std::vector<int8_t> a=mappe.data;
		mappaNuova= new unsigned char[sizemap];
		PopoloMappa(a,mappaNuova,sizemap);
		//StampaOccupancyGrid(mappaNuova, sizemap, width);
		//printf("Ora controllo se ci sono stati cambiamenti nella mappa!\n");
		
		if(OstacoloInPath(mappaNuova,sizemap,width,percorso))
		{
			Action(mappe);
			break;
		}
		i++;
	}
	//dovrei essere arrivato alla fine o errore
	printf("Fine!\n");
	primitive.clear();
	percorso.clear();
	exit(EXIT_SUCCESS);
}

void Action(nav_msgs::OccupancyGrid mappe)
{
    width=mappe.info.width;
    height=mappe.info.height;
    resolution = mappe.info.resolution;
    int val,count=0;
    double start_x; //coordinate di start del robot
    double start_y;
    
    //azzero le primitive e percorso
    primitive.clear();
    percorso.clear();

	
   //estrazione del vettore dei costi usando i tipi di Ros
    std::vector<int8_t> a=mappe.data;
    sizemap=a.size();

    
    printf("risoluzione della mappa:%f\n",resolution);
    printf("sizemap:%d, width=%d, height=%d\n",sizemap,width,height);
    
   
    //estrazione delle info sulla discretizzazione ecc
    mappaStorica= new unsigned char[sizemap];  //il vettore della mappa iniziale
    PopoloMappa( a,mappaStorica,sizemap);


   
    //ciclo di stampa della mappa  
   // StampaOccupancyGrid(mappaStorica,sizemap,width);
   std::vector<int> celleOccupate= CelleOccupate(mappaStorica,sizemap,height);
   
   
   	tf::TransformListener listener;
	//ros::Rate rate(10);
	tf::StampedTransform transform;

	//leggo la casella di partenza
	try
	{
		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());

	} 
	//ros::Duration(0.3).sleep();
	    
	start_x=transform.getOrigin().x();
	start_y=transform.getOrigin().y();
	ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
	

	int source[] = {cell_y, cell_x}; //cella di partenza (invertite a causa dell'inversione delle mappe di 180 gradi)
	int target[] = {target_x, target_y}; //cella di goal
	
	printf("parto da [%d,%d] e devo arrivare in [%d,%d]\n",source[0], source[1],target[0], target[1]);
	
	p1.set_map_size(width, height, 0);
	
	p1.set_source(source[0], source[1], 0);

	p1.set_destination(target[0], target[1], 0);
	

	int x,y;
	//aggiungiamo gli ostacoli (da rivedere meglio?)). L'alternariva sarebbe farla con la set_obstacles
	for(int i=0;i<celleOccupate.size();i++)
	{
		x=celleOccupate.at(i);
		i++;
		y=celleOccupate.at(i);
		p1.add_obstacle(x,y,0);	
	}
	
	
	std::list<int> path;



	timeval tim;
	double t1 = 0.0;
	double t2 = 0.0;

	gettimeofday(&tim, NULL);
	t1=tim.tv_sec+(tim.tv_usec/1000000.0);
	
	//calcolo del path in termini di primitive (da convertire in movimenti per il robot)
	printf("Calcolo il percorso!\n");
//	p1.compute_GPU_path(0,true,path);
	p1.compute_CPU_path(true,path);


	gettimeofday(&tim, NULL);
	t2=tim.tv_sec+(tim.tv_usec/1000000.0);

	printf("TIME: %.4f (s)\n", (float)(t2-t1));
	 //p1.print_map_2D();
	 //p1.print_map_path_2D(path);
	 int countPrimitive=0;

	 std::list<int>::iterator it;
	 
	 for(it=path.begin(); it!=path.end(); ++it) 
	 {
	 	int primitiva = *it;
	 	primitive.push_back(primitiva);
	 	countPrimitive++;
	 	it++; //ogni primitiva è rappresentata da 3 valori nella lista path ( primitiva, nodo precedente, costo))
	 	it++;
	 }

	 printf("totale primitive:%d\n",countPrimitive);


	//a questo punto abbiamo un vettore pieno delle primitive da attuare
	if(primitive.size()==0)
	{
		printf("Nessun percorso disponibile!!\n");
		exit(EXIT_FAILURE) ;
	}
		
	//else	
		//MuoviRobot(primitive);
		
}


void mapCallback(const nav_msgs::OccupancyGrid::ConstPtr& map)
{
    mappe=*map; //il puntatore alla mappa iniziale
    Action(mappe);
}


//void positionCallback(const geometry_msgs::TwistConstPtr& cmdVel)
//{
//	tf::TransformListener listener;
//	ros::Rate rate(10);
//	tf::StampedTransform transform;
//	int cell_x,cell_y;
//	double start_x; //coordinate di start del robot
//        double start_y;
//	geometry_msgs::TwistConstPtr ptr= cmdVel;
//	
//	//ad ogni comando dato al robot leggo la posizione corrente
//	try
//	{
//		listener.waitForTransform("/map", "/base_footprint", ros::Time(0), ros::Duration(2.0) );
//		listener.lookupTransform("/map","/base_footprint",ros::Time(0), transform);
//	}
//	catch (tf::TransformException ex)
//	{
//		ROS_ERROR("Nope! %s", ex.what());
//		//ros::Duration(1.0).sleep();
//	} 
//	    
//	start_x=transform.getOrigin().x();
//	start_y=transform.getOrigin().y();
//	//ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
//	printf("Sono alla casella: [%d,%d]\n",cell_x,cell_y);
//}



void AggiornamentoMappa(const map_msgs::OccupancyGridUpdateConstPtr& msg)
{
	int index = 0;
	 for(int y=msg->y; y< msg->y+msg->height; y++)
	 {
	 	for(int x=msg->x; x< msg->x+msg->width; x++)
			 mappe.data[ getIndex(x,y,mappe) ] = msg->data[ index++ ];	
	 }
	std::vector<int8_t> a=mappe.data;
	mappaNuova=new unsigned char[sizemap];
	PopoloMappa(a,mappaNuova,sizemap);
}



int main(int argc, char **argv)
{
			
  if(argc!=3)
  {
  	printf("usage: rosrun wrapper_planner main_core target_x target_y\n");
	return 1;
  }
		
  ros::init(argc, argv, "Wrapper_planner");
  ros::NodeHandle n;

  //ros::Subscriber sub = n.subscribe("/map", 10, mapCallback);  // si potrebbe usare anche la mappa statica, ma non si avrebbero i costi (inflatius radius non è influente))
  ros::Subscriber sub = n.subscribe("/move_base/global_costmap/costmap", 10, mapCallback); //uso la global costmap al posto della mappa normale
  ros::Subscriber subUpdates = n.subscribe("/move_base/global_costmap/costmap_updates", 10,AggiornamentoMappa);
  
  target_x=atoi(argv[1]);
  target_y=atoi(argv[2]);
  
  printf("target_x=%d, target_y=%d\n",target_x,target_y);
  
  //debug
  //ros::Subscriber subVel = n.subscribe("/husky/cmd_vel", 10, positionCallback);
  ros::MultiThreadedSpinner spinner(4);
  while(ros::ok())
   spinner.spin();

  return 0;
}
