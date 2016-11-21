#include "ros/ros.h"
#include "std_msgs/String.h"
#include "nav_msgs/OccupancyGrid.h"
#include <cstdio>
#include "ros/console.h"
#include <sstream>
#include "nav_msgs/MapMetaData.h"
#include "stdio.h"
#include <iostream>
#include <fstream> //header necessario per ofstream!
#include <tf/transform_listener.h>
#include <wrapper_planner/Functions.h>
#define EPSILON_ROT 0.5
#define EPSILON_LIN 0.009

using namespace std;


vector<string> primitive;
nav_msgs::OccupancyGrid::ConstPtr mappe;
ros::Publisher cmd_vel_pub_;
int width,height;
float resolution;





void AllineaRobot(int gradi)
{
	bool allineato=false;
	
	//prendo il tf del base_link 
	tf::TransformListener listener;
	ros::Rate rate(10);
	tf::StampedTransform transform;

	try
	{
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());

	} 
	
	double start_angle=ConvertiRadInGradi(tf::getYaw(transform.getRotation())); //angolo di partenza
	
	 
	if(start_angle<0)
		start_angle+=360; //trasformo tutti in positivo	
	printf("start angle (gradi):%f\n",start_angle);	

	double destinationAngleRad=gradi+start_angle; //angolo di destinazione in gradi
	
	if(destinationAngleRad>=360)
		destinationAngleRad-=360;	//trasformo

	
        while(!allineato)
        {
            try
	    {
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	    }
	    catch (tf::TransformException ex)
	    {
		ROS_ERROR("Nope! %s", ex.what());
		//ros::Duration(0.5).sleep();
	    } 
	    
	    double angolo_current=ConvertiRadInGradi(tf::getYaw(transform.getRotation()));
	   
	    if(angolo_current<0)
	    	angolo_current+=360;


	    double final=destinationAngleRad-angolo_current;
	    printf("Destination angle:%f, current angle:%f\n",destinationAngleRad,angolo_current);
	    printf("differenza: %f\n",final);    
	    
	   
	        
	    if(abs(final)<=EPSILON_ROT)
	    {
	  	allineato=true;
	    	printf("Allineato!\n");
	    }	 
	    else
	    {
	    	//mando un comando di rotazione
	    	allineato=false;
	    	geometry_msgs::Twist cmd_rot;
	    	
	    	if(gradi>0) //ruotiamo in base alla primitiva segnalata
	    	{
	    		printf("ruota verso sx!\n");
	    		cmd_rot.angular.z=0.1;
	    	}	
	    	else
	    	{
	    		printf("ruota verso dx!\n");
	    		cmd_rot.angular.z=-0.1;
	    	}		
	    	cmd_vel_pub_.publish(cmd_rot);
	    }
	    ros::Duration(0.1).sleep();	  //aumentare il time se vogliamo renderlo piu lento 
        }
}

void AvanzaCasella()
{
	bool avanzamento=false;
	

	tf::TransformListener listener;
	ros::Rate rate(10);
	tf::StampedTransform transform;

	double start_x; //coordinate di start del robot nella casella corrente
        double start_y;
	double destination_x;
	double destination_y;
	double dist,diff;
	int cell_x,cell_y;
	geometry_msgs::Twist cmd_lin;
	        
        try
	{
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());

	} 
	    
	start_x=transform.getOrigin().x();
	start_y=transform.getOrigin().y();
	ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
	printf("Parto dalla casella: [%d,%d]\n",cell_x,cell_y);

	 while(!avanzamento)
	 {
	    try
	    {
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	    }
	    catch (tf::TransformException ex)
	    {
		ROS_ERROR("Nope! %s", ex.what());
		//ros::Duration(1.0).sleep();
	    } 
	    
	     destination_x=transform.getOrigin().x();
	     destination_y=transform.getOrigin().y();
	     ReturnCoordinateCells(&cell_x, &cell_y,destination_x,destination_y,mappe);
	     printf("L'ultima modifica mi ha portato alla casella: [%d,%d]\n",cell_x,cell_y);
	     

	     dist=sqrt((destination_x-start_x)*(destination_x-start_x) + (destination_y-start_y)*(destination_y-start_y));
	     diff=dist-resolution;
	   
	     
	     printf("start_x=%f, start_y=%f, destination_x=%f, destination_y=%f\n",start_x,start_y,destination_x,destination_y);
	     printf("differenza: %f\n",diff);

	     if(abs(diff)<=EPSILON_LIN)
	     {
	     	avanzamento=true;
	     	printf("avanzamento di cella completato!\n");
	     }	 
	     else
	     {
	    	//mando un comando di traslazione
	    	printf("trasla ancora!\n");
	    	cmd_lin.linear.x=0.1;	
	        cmd_vel_pub_.publish(cmd_lin);
	    	avanzamento=false;
	     }		
	     ros::Duration(0.1).sleep();   //aumentare il time se vogliamo renderlo piu lento 
	 }    
}

void MovimentoRobot(int gradi)
{
 	 ros::NodeHandle nh_;
  	cmd_vel_pub_=nh_.advertise<geometry_msgs::Twist>("/husky/cmd_vel",1);
  	
  	//rotazione robot finche non è allineato nella direzione dove deve andare
  	AllineaRobot(gradi);
  	
  	//avanzamento casella (ogni casella è un quarto della cella grande che si vede dentro. Ogni casella vale 0.5m)
  	AvanzaCasella();
}


void AzioneByNamePrimitiva(string primitiva)
{
	int gradi=-1;
	
	if(primitiva.compare("go_north")==0)
	{
		gradi=0;
		printf("proseguo verso nord\n");
	}
//	else if(primitiva.compare("go_ne")==0)
//	{
//		gradi=-45;
//		printf("proseguo in direzione nord est\n");
//	}
	else if(primitiva.compare("go_east")==0)
	{
		gradi=-90;
		//gradi=270
		printf("proseguo in direzione est!\n");
	}	
//	else if(primitiva.compare("go_se")==0)
//	{
//		gradi=-135;
//		printf("proseguo in direzione sud-est!\n");
//	}
	else if(primitiva.compare("go_south")==0)
	{
		gradi=180;
		printf("proseguo in direzione sud!\n");
	}
//	else if(primitiva.compare("go_sw")==0)
//	{
//		gradi=135;
//		printf("proseguo in direzione sud-ovest!\n");
//	}
	else if(primitiva.compare("go_west")==0)
	{
		gradi=90;
		printf("proseguo in direzione ovest!\n");
	}
//	else if(primitiva.compare("go_nw")==0)
//	{
//		gradi=45;
//		printf("proseguo in direzione nord-ovest!\n");
//	}	
	else
	{
		printf("primitiva non riconosciuta!\n");
		gradi=-1;
	}
			
		
	if(gradi!=-1)
		MovimentoRobot(gradi);	
			
}


void MuoviRobot(vector<string> primitive)
{
	int i=0;
	while(i<primitive.size())
	{
		printf("primitiva in lavorazione: %s\n",primitive.at(i).c_str());
		AzioneByNamePrimitiva(primitive.at(i));
		i++;
	}
	
	printf("Primitive finite. Arrivato al goal (Teoricamente)\n");
	printf("Svuoto il vettore di primitive!\n");
	primitive.clear();
}



void mapCallback(const nav_msgs::OccupancyGrid::ConstPtr& map)
{

    mappe=map;
    width=mappe->info.width;
    height=mappe->info.height;
    resolution = mappe->info.resolution;
    int val,count=0;
    double start_x; //coordinate di start del robot
    double start_y;

	
   //estrazione del vettore dei costi usando i tipi di Ros
    std::vector<int8_t> a=mappe->data;
    int i=0;
    int sizemap=a.size();
    int cell_x,cell_y;
    
    printf("risoluzione della mappa:%f\n",resolution);
    printf("sizemap:%d\n",sizemap);
   
    //estrazione delle info sulla discretizzazione ecc
    nav_msgs::MapMetaData meta=mappe->info;
    unsigned char mappa[sizemap];

    //in questo ciclo vengono semplificati i costi, in fase di
    //discretizzazione qualche area ai bordi della mappa veniva
    //dichiarata come non esplorata, uniformiamo trasformandole
    //tutte in libere e estraendo le occupate formando il vettore.
	
    i=0;	
    while(i<sizemap)
    {
	int temp=a[i];
	if( (temp == 0) )
		{mappa[i]='0';}
	else if(temp== -1)
		{mappa[i]='-';}
	else
		{mappa[i]='1';}	
	i++;
   }
   
   
    //ciclo di stampa della mappa  
    StampaOccupancyGrid(mappa,sizemap,width);
   //int** celleOccupate= CelleOccupate(mappa,sizemap);
   
   	tf::TransformListener listener;
	ros::Rate rate(10);
	tf::StampedTransform transform;

	//leggo la casella di partenza
	try
	{
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());

	} 
	    
	start_x=transform.getOrigin().x();
	start_y=transform.getOrigin().y();
	ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
	printf("Parto dalla casella: [%d,%d]\n",cell_x,cell_y);
	//printf("posx=%f, posy=%f\n",start_x,start_y);


 
//  //flusso logico per l'implementazione del wrapper di daniele  
//	
//    //settiamo la mappa storica ( quella dal map server)		
//    SetMap(x, y, celleOccupate, cell_x,cell_y,goal_x,goal_y);  
//    
//    //aggiorniamo la singola cella in caso di modifica (da laserscanner)
//    UpdateMap();
//    
//    //calcolo del path in termini di primitive (da convertire in movimenti per il robot)
//    primitive=Compute();
	
	

	//uso solo primitive non diagonali come go_nw. questo percorso dovrebbe essere un rettangolo e si torna nella posizione iniziale
	primitive.push_back("go_north");
	primitive.push_back("go_north");
	primitive.push_back("go_west");
	primitive.push_back("go_north");
	primitive.push_back("go_west");
	primitive.push_back("go_north");
	primitive.push_back("go_north");
	primitive.push_back("go_west");
	primitive.push_back("go_north");
	primitive.push_back("go_west");



	
	
	//debug
//	i=0;
//	while(i<primitive.size())
//	{
//		printf("primitiva: %s\n",primitive.at(i).c_str());
//		i++;
//	}

	//a questo punto abbiamo un vettore pieno delle primitive da attuare
	if(primitive.size()==0)
		printf("Nessun percorso disponibile!!\n");
	else	
		MuoviRobot(primitive);
		
}


void positionCallback(const geometry_msgs::TwistConstPtr& cmdVel)
{
	tf::TransformListener listener;
	ros::Rate rate(10);
	tf::StampedTransform transform;
	int cell_x,cell_y;
	double start_x; //coordinate di start del robot
        double start_y;
	geometry_msgs::TwistConstPtr ptr= cmdVel;
	
	//ad ogni comando dato al robot leggo la posizione corrente
	try
	{
		listener.waitForTransform("/map", "/base_link", ros::Time(0), ros::Duration(2.0) );
		listener.lookupTransform("/map","/base_link",ros::Time(0), transform);
	}
	catch (tf::TransformException ex)
	{
		ROS_ERROR("Nope! %s", ex.what());
		//ros::Duration(1.0).sleep();
	} 
	    
	start_x=transform.getOrigin().x();
	start_y=transform.getOrigin().y();
	ReturnCoordinateCells(&cell_x, &cell_y,start_x,start_y,mappe);
	printf("Sono alla casella: [%d,%d]\n",cell_x,cell_y);
}




int main(int argc, char **argv)
{
  ros::init(argc, argv, "Wrapper_planner");
  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/map", 10, mapCallback);
  //ros::Subscriber sub = n.subscribe("/move_base/global_costmap/costmap", 10, mapCallback); //uso la global costmap al posto della mappa normale
  
  //debug
  //ros::Subscriber subVel = n.subscribe("/husky/cmd_vel", 10, positionCallback);
  

  ros::spin();

  return 0;
}
