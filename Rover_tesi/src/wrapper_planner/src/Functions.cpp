#include "stdio.h"
#include "ros/ros.h"
#include "nav_msgs/MapMetaData.h"
#include "nav_msgs/OccupancyGrid.h"
#include <wrapper_planner/Functions.h>
#include "stdlib.h"


void StampaOccupancyGrid(unsigned char mappa[],int sizemap,int width)
{
    int	i=0;
   
   while(i<sizemap)
   {
   //stampo solo le occupate
	if(mappa[i]=='0') 
		printf(" ");
	else
	        if(mappa[i]=='1') printf("1");	
	else 
		printf("-");	
		
	if((i+1)%width==0 && i!=0) //per andare a capo
		printf("\n");	
	i++;	
   }
}


//ogni due int della lista rappresentano le coordinate x,y dell'ostacolo'
std::vector<int> CelleOccupate(unsigned char mappa[],int sizemap,int width)
{
	int i=0,count=0;  
	std::vector<int> celle;
	
	//DEBUG
//	while(i<sizemap)
//	{
//		if(mappa[i]=='1')
//		 count++;
//		i++;
//	}
//	printf("Celle occupate:%d\n",count);

	 	
	//rileggo la mappa e popolo il vettore
	i=0;
	int x=0,y=0,numCella=0;
	
	while(i<sizemap)     //da riguardare
	{
		if((i+1)%width != 0)
		{
			y=i%width;
			x=((i+1)/width);
		}	
		else
		{
			y=i%width;
			x=((i+1)/width);
		}

		if(mappa[i]=='1') //le celle sconosciute sono considerate 
		{	
			celle.push_back(x);
			celle.push_back(y);
		}
		i++;
	}
	return celle;
}




//funzione per vedere in che cella è posizionato all'incirca il robot
void ReturnCoordinateCells(int *cell_x, int *cell_y,float posRobot_x, float posRobot_y,nav_msgs::OccupancyGrid mappe)
{
	float pos_x=(posRobot_x- mappe.info.origin.position.x)/mappe.info.resolution;
	float pos_y=(posRobot_y- mappe.info.origin.position.y)/mappe.info.resolution;
	printf("posx=%f, posy=%f\n",pos_y,pos_x);
	*cell_x=(unsigned int)pos_x; // ho aggiunto 1 perche ho considerato che la mappa inizia con la cella [1,1]
	*cell_y=(unsigned int)pos_y;	
}


//funzione che estraendo degli interi da un vettore, popola il relativo vettore di char che rappresenta la mappa
void PopoloMappa(std::vector<int8_t> a,unsigned char *mappa,int sizemap)
{
    int i=0;	
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
}

//funzione che restituisce l'indice di una determinata casella di una occupancy Grid
int getIndex(int x, int y,const nav_msgs::OccupancyGrid grid)
{
	 int sx = grid.info.width;
 	return y * sx + x;
}


int RiconosciPrimitiva(int primitiva)
{
	int gradi;
	switch(primitiva)
	{
		case 1: 
			printf("go0 :: Up \n");
			gradi=180;
			break;
		case 2: printf("go45 :: Up-Right \n");
			gradi=135;
			break;
		case 3: printf("go90 :: Right \n");
			gradi=90;
			break;
		case 4: printf("go135 :: Down-Right \n");
			gradi=45;
			break;
		case 5: printf("go180 :: Down \n");
			gradi=0;
			break;
		case 6: printf("go225 :: Down-Left \n");
			//gradi=-45;
			gradi=315;
			break;
		case 7: printf("go270 :: Left \n");
			//gradi=-90;
			gradi=270;
			break;
		case 8: 
		{
			printf("go315 :: Up-Left \n");
			//gradi=-135;
			gradi=225;
			break;
		}
		
		default: gradi=-1;
			printf("primitiva non riconosciuta\n");	
	}
	
	return gradi;
}

//popola un array con le celle da attraversare (funzione utile in seguito per scoprire se c'e un ostacolo lungo il percorso)
void PopolaPercorso(std::vector<int> primitive, std::vector<int> &percorso,int cell_x, int cell_y)
{
	int i=0;
	int path_x,path_y;
	
	while(i<primitive.size())
	{
		if(primitive.at(i)==4 || primitive.at(i)==5 || primitive.at(i)==6 )
			path_x=cell_y+1;
		else if(primitive.at(i)==1 || primitive.at(i)==2 || primitive.at(i)==8)	
			path_x=cell_y-1;
		else
			path_x=cell_y;
			
		if(primitive.at(i)==2 || primitive.at(i)==3 || primitive.at(i)==4 )
			path_y=cell_x+1;
		else if(primitive.at(i)==6 || primitive.at(i)==7 || primitive.at(i)==8)	
			path_y=cell_x-1;
		else
			path_y=cell_x;	
			
		percorso.push_back(path_y);
		percorso.push_back(path_x);	
		cell_y=path_x;
		cell_x=path_y;	
		i++;
	}
}	
void StampaCelleVector(std::vector<int> lista)
{
	int cell_y,cell_x;
	for(int i=0;i<lista.size();i++)
	{
		int cell_y=lista.at(i);
		i++;
		int cell_x=lista.at(i);
		printf("[%d,%d] ",cell_y,cell_x);	
	}
		
		
	printf("\n\n");
	
}

bool OstacoloInPath(unsigned char mappaNuova[],int sizemap,int width,std::vector<int> percorso)
{
	int i=0;
	bool trovato=false;
	int p_x,p_y;
	int o_x,o_y;
	std::vector<int> occupied=CelleOccupate(mappaNuova, sizemap, width);
	
	//DEBUG
//	printf("celle Percorso:\n");
//	StampaCelleVector(percorso);
//	
//	printf("celle occupate:\n");
//	StampaCelleVector(occupied);
	
	for(i=0;i<percorso.size();i++)
	{
		p_y=percorso.at(i);
		i++;
		p_x=percorso.at(i);
		for(int k=0;k<occupied.size();k++)
		{
			o_y=occupied.at(k);
			k++;
			o_x=occupied.at(k);
			if(p_y==o_y && p_x==o_x)
				{
					printf("Trovata possibile collisione!\n");
					printf("mappa:[%d,%d]---> percorso:[%d,%d]\n",o_y,o_x,p_y,p_x);
					trovato=true;
					break;
				}
		}
		if(trovato)
			break;
	}
		
	return trovato;	
}


