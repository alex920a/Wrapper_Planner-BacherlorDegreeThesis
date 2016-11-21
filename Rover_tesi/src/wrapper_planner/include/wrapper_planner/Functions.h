#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include "ros/ros.h"
#include "nav_msgs/MapMetaData.h"
#include "nav_msgs/OccupancyGrid.h"
#include "stdlib.h"

void StampaOccupancyGrid(unsigned char mappa[],int sizemap,int width);
std::vector<int> CelleOccupate(unsigned char mappa[],int sizemap,int width);
void ReturnCoordinateCells(int *cell_x, int *cell_y,float posRobot_x, float posRobot_y,nav_msgs::OccupancyGrid mappe);
void PopoloMappa(std::vector<int8_t> a,unsigned char *mappa,int sizemap);
int getIndex(int x, int y,const nav_msgs::OccupancyGrid grid);
void PopolaPercorso(std::vector<int> primitive, std::vector<int> &percorso,int cell_x, int cell_y);
int RiconosciPrimitiva(int primitiva);
bool OstacoloInPath(unsigned char mappaNuova[],int sizemap,int width,std::vector<int> percorso);
void StampaCelleVector(std::vector<int> lista);

#endif
