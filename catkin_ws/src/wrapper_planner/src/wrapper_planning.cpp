#include <cstdio>
#include <stdio.h>
#include "ros/ros.h"
#include "ros/console.h"
#include <iostream>
#include <fstream>
#include <string>
#include "nav_msgs/GetMap.h"
#include "tf/LinearMath/Matrix3x3.h"
#include "geometry_msgs/Quaternion.h"

#include <wrapper_planner/wrapper_planning.h>

using namespace std;  
  
namespace wrapper_planner
{
	//costruttore
     WrapperPlanning::WrapperPlanning(): goal_reached_(false);
     
     	


}//  namespace wrapper_planner
