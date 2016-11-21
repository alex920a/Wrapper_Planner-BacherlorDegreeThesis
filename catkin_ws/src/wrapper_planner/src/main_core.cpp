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

using namespace std;

nav_msgs::OccupancyGrid::ConstPtr mappe;

void mapCallback(const nav_msgs::OccupancyGrid::ConstPtr& map)
{

  mappe=map;
  int x=mappe->info.width;
  int y=mappe->info.height;
  int val,count=0;
  
	
   //estrazione del vettore dei costi usando i tipi di Ros
    std::vector<int8_t> a=mappe->data;
    int i=0;
    int sizemap=a.size();
    
    printf("sizemap:%d\n",sizemap);
    


    //estrazione delle info sulla discretizzazione ecc
    nav_msgs::MapMetaData meta=mappe->info;
    unsigned char mappa[sizemap];

    //in questo ciclo vengono semplificati i costi, in fase di
    //discretizzazione qualche area ai bordi della mappa veniva
    //dichiarata come non esplorata, uniformiamo trasformandole
    //tutte in libere e estraendo le occupate formando il vettore.
    while(i<sizemap)
    {
	int temp=a[i];
	if( (temp == 0))
		{mappa[i]='0';}
	else
		{mappa[i]='1';}
		
	i++;
   }
   
   
    //ciclo di stampa della mappa 
   //decommentare gli if per ottenere comportamenti diversi
   
   i=0;
   
   while(i<sizemap)
   {
   //stampo solo le libere
	if(mappa[i]=='0')
		printf(" ");
	else
		printf("1 ");	
	
	if(i%(x+1)==0 && i!=0)
		printf("\n");
	
	//printf("%c ",mappa[i]);
		
	i++;	
   }
   
 

}

int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line. For programmatic
   * remappings you can use a different version of init() which takes remappings
   * directly, but for most command-line programs, passing argc and argv is the easiest
   * way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "listener");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The subscribe() call is how you tell ROS that you want to receive messages
   * on a given topic.  This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing.  Messages are passed to a callback function, here
   * called chatterCallback.  subscribe() returns a Subscriber object that you
   * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
   * object go out of scope, this callback will automatically be unsubscribed from
   * this topic.
   *
   * The second parameter to the subscribe() function is the size of the message
   * queue.  If messages are arriving faster than they are being processed, this
   * is the number of messages that will be buffered up before beginning to throw
   * away the oldest ones.
   */
  ros::Subscriber sub = n.subscribe("/map", 10, mapCallback);

  //ros::Publisher pub = n.advertise<nav_msgs::OccupancyGrid>("/map", 10);
  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
   
    
  ros::spin();
  


  return 0;
}
