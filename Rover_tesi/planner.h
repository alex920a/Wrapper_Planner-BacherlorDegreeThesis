/*
============================================================================
	Auth:			Daniele Palossi	(daniele.palossi@unibo.it)	
 	Description: 	Planner Library for SHERPA project					
============================================================================
*/


#define NB_WI 64
#define NB_WG 16

// #define PROFILING
// #define PROFILING_OCL
#define MAX_MAP_SIZE 50
// #define TEST_ITERATIONS 50

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_GREEN   "\x1b[32m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLUE    "\x1b[34m"
#define ANSI_COLOR_MAGENTA "\x1b[35m"
#define ANSI_COLOR_CYAN    "\x1b[36m"
#define ANSI_COLOR_RESET   "\x1b[0m"

#define COSTS 10,15,10,15,10,15,10,15,0,0,0,0
#define DRONE_EVENTS 1,2,3,4,5,6,7,8,9,10,11,12



#include <string>
#include <float.h>		// FLT_MAX
#include <limits.h>		// INT_MAX
#include <string>
#include <cstring>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <algorithm>    // std::max
#include <sys/time.h>	//gettimeofday
#include <list>
#include "CL/cl.h"  
// #include "PlannerKernel.h"

typedef struct {

	/* Number of the events */
    int n; 
	/* Events */		
   	int* e; 

} Events;

typedef struct {

	/* Number of the states */
    int nb_states; 
	/* Number of the events */
    int nb_events;   
	/* Events */
    int *events;   
	/* Transactions matrix (nxe) */		
    int **trans_matrix;
    /* Initial states */
    int *init_states;
    /* Goal states */
    int *goal_states;

} Automa;
		
class Planner {

	public: 

		Planner();  // ok
				
		~Planner();  // ok
		
		/**	
		 * Setup a pre-built Automa representing the map
		 *
		 * @param[in] G is the pointer to the Automa structure
		*/	
		void setup_automa_map(Automa &G); // ok


		/**	
		 * Setup a pre-built Automa representing the drone
		 *
		 * @param[in] G is the pointer to the Automa structure
		*/	
		void setup_automa_drone(Automa &G);	// ok


		/**	
		 * Set the dimensions of the map (x*y*z)
		 *
		 * @param[in] x dimension
		 * @param[in] y dimension
		 * @param[in] z dimension
		 * @return the error code (0 means no errors occurred).
		*/	
		 int set_map_size(int x, int y, int z); // ok



		/**	
		 * Set a list of obstacles in the map representation.
		 *
		 * @param[in] obstacles specifies the occupied cells in a list format
		*/	
		void set_obstacles(std::list<int> obstacles); // ok


		/**	
		 * Add a single obstacle in the map representation giving the coordinates.
		 *
		 * @param[in] x coordinate.
		 * @param[in] y coordinate.
		 * @param[in] z coordinate.
		*/	
		int add_obstacle(int x, int y, int z); // ok


		/**	
		 * Remove a single obstacle in the map representation giving the coordinates.
		 *
		 * @param[in] x coordinate.
		 * @param[in] y coordinate.
		 * @param[in] z coordinate.
		 * @return the error code (0 means no errors occurred).
		*/	
		int remove_obstacle(int x, int y, int z); // ok


		/**	
		 * Set the source location in the map representation giving the coordinates.
		 *
		 * @param[in] x coordinate.
		 * @param[in] y coordinate.
		 * @param[in] z coordinate.
		*/
		void set_source(int x, int y, int z); // ok


		/**	
		 * Set the destination in the map representation giving the coordinates.
		 *
		 * @param[in] x coordinate.
		 * @param[in] y coordinate.
		 * @param[in] z coordinate.
		*/
		void set_destination(int x, int y, int z); // ok


		/**	
		 * Compute the SSSP using Dijkstra algorithm on the Intel HD Graphics.
		 * There are three OpenCL versions: 2 deterministic and 1 not-deterministic
		 *
		 * @param[in] type the specific type of Dijkstra implementation. 
		 * 0 means the deterministic (atomic) version, 
		 * 1 means the deterministic (multi-buffers) version and 
		 * 2 means the not-deterministic (fastest) version.
		 * @param[out] path from source to destination in terms of primitives movements (e.g. go0, go45, go90, etc). 
		 * @return the error code (0 means no errors occurred).
		*/	
		int compute_GPU_path(int type, std::list<int> &path);


		/**	
		 * Compute the SSSP using Dijkstra algorithm on the Intel CPU.
		 *
		 * @param[out] path from source to destination in terms of primitives movements (e.g. go0, go45, go90, etc). 
		 * @return the error code (0 means no errors occurred).
		*/	
		int compute_CPU_path(std::list<int> &path);
	

		/**	
		 * Test
		 *
		 * @param[in]
		 * @param[in] 
		 * @return the final state for the test.
		 * True means test passed, false otherwise.
		*/
		bool test_path(std::list<int> path_cpu, std::list<int> path_gpu);


		/**	
		 * Print the transaction matrix for the specified type of automaton.
		 *
		 * @param[in] type specifies the automaton to be print:
		 * 0: for map automaton
		 * 1: for drone automaton
		 * 2: for composition automaton
		*/	
		void print_automa(int type); // ok


		/**	
		 * Print all events informations.
		 * Map events, Drone events, common events, private events, and all events.
		*/	
		void print_events();


		/**	
		 * Print all primitives composing the computed path and the total cost.
		 *
		 * @param[in] path is the list of all events that compose the entire 
		 * path. For each single step in the map three integer elements must be set
		 * in the list and they are:
		 * . primitive event (where 1 means go0, 2 means go45, etc.)
		 * . cost until this step
		 * . predecessor node id 
		*/	
		void print_path(std::list<int> path); // ok


		/**	
		 * Print bi-dimensional representation of the map, where:
		 * X represents occupied cells.
		 * S represents Source point (in blue)
		 * G represents Goal point (in blue)
		*/	
		void print_map_2D(); // ok


		/**	
		 * Print bi-dimensional representation of the map with the path from the
		 * source (S) to the destination (G), where:
		 * X represents occupied cells.
		 * S represents Source point (in blue)
		 * G represents Goal point (in blue)
		 * * represents the single step of the entire path (in red)
		 *
		 * @param[in] path is the list of all events that compose the entire 
		 * path. For each single step in the map three integer elements must be set
		 * in the list and they are:
		 * . primitive event (where 1 means go0, 2 means go45, etc.)
		 * . cost until this step
		 * . predecessor node id
		*/	
		void print_map_path_2D(std::list<int> path); // ok

		
	private:

		Automa map;
		Automa drone;
		Automa composition;
		int map_size[3];
		int source[3], destination[3];
		std::list<int> obstacles;
		bool new_obstacles;
		int *events_common, *map_events_private, *drone_events_private;
		Events events_all;

		/* OpenCL memory objects */
		cl_mem 	maskArrayDevice,
				transMatrixDevice,
				costArrayDevice,
				updatingCostArrayDevice,
				updatingPrevArrayDevice,
				updatingMaskFlagDevice,
				prevArrayDevice,
				maskFlagDevice;

		cl_context 			context;
		cl_command_queue	commandQueue;
		cl_program 			program;
		cl_device_id 		device;
		cl_kernel 			kernel_init,
							kernel_dijkstra1, 
							kernel_dijkstra2, 
							kernel_dijkstra3;


		int build_map(); // ok

		void build_drone(); // ok

		void filterAutoma(Automa &G);

		void update_source_destination(); // ok

		int update_trans_matrix(Automa &G, int null_row); // ok

		void add_trans_matrix(Automa a, int *from, int *to, Events event); // ok

		void compute_obstacle(); // ok

		void parallel_composition(); // ok

		void from2Dto1D(Automa G, int *&trans_matrix); // ok

		int find(int n, int *events, int e); // ok

		void sort(int n, int *src); // ok

		int maskArrayEmpty(int *maskArray, int count); // ok

		bool computeMapPath(std::list<int> event_path, std::list<int> &path); // ok

		int events_analyzer();  // ok

		int dijkstra(std::list<int> &result); // ok

		void refine_path();

		int dijkstra_ocl_super_atomic(std::list<int> &result); // ok

		int dijkstra_ocl_multi(std::list<int> &result); // ok

		int dijkstra_ocl_perf(std::list<int> &result); // ok

		int dijkstra_ocl_atomic(std::list<int> &result); // ok

		void oclClean(); // ok
};