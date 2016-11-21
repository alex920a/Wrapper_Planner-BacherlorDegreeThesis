/*
============================================================================
	Auth:   Daniele Palossi (daniele.palossi@unibo.it)
	Description: OpenCL kernel
============================================================================
*/

//#pragma OPENCL EXTENSION cl_khr_int32_base_atomics : enable
//#pragma OPENCL EXTENSION cl_khr_int32_extended_atomics : enable

#pragma OPENCL EXTENSION cl_khr_global_int32_base_atomics : enable
#pragma OPENCL EXTENSION cl_khr_local_int32_base_atomics : enable
#pragma OPENCL EXTENSION cl_khr_global_int32_extended_atomics : enable
#pragma OPENCL EXTENSION cl_khr_local_int32_extended_atomics : enable



/* ===================== PERFORMANCE: NOT DETERMINISTIC ===================== */

__kernel void initializeBuffers_perf(	__global int *maskArray,
                                		__global unsigned int *costArray,
	                                	//__global int *eventArray,
	                                	//__global int *prevArray,
	                                	int sourceVertex,
	                                	int n_vertex) {
	
	for(int tid = get_global_id(0); tid < n_vertex; tid += get_global_size(0)) {


	    if (sourceVertex == tid+1) {

	        maskArray[tid] = 1;
	        costArray[tid] = 0;
	    }
	    else {

	        maskArray[tid] = 0;
	        costArray[tid] = UINT_MAX << 20;;
	    }

	   	//eventArray[tid] = 0;
	    //prevArray[tid] = 0;
	}
}


__kernel void dijkstra_perf(__global int *maskArray,
							__global int *transMatrixArray,
							__global unsigned int *costArray,
							//__global int *eventArray,
							//__global int *prevArray,
                       		__global int *maskFlag,						
                        	int n_event,
                        	int n_vertex) {

	if(get_global_id(0)==0) maskFlag[0] = 0;

	unsigned int weightArray[12];
	unsigned int newCost;
	int nid;
	weightArray[0] = 10;
	weightArray[1] = 15;
	weightArray[2] = 10;
	weightArray[3] = 15;
	weightArray[4] = 10;
	weightArray[5] = 15;
	weightArray[6] = 10;
	weightArray[7] = 15;
	weightArray[8] = 0;
	weightArray[9] = 0;
	weightArray[10] = 0;
	weightArray[11] = 0;


	for(int tid = get_global_id(0); tid < n_vertex; tid += get_global_size(0)) {
	
		if(maskArray[tid] != 0) {

			maskArray[tid] = 0;

			for(int y=0; y<n_event; y++) {

				nid = transMatrixArray[tid*n_event+y];

				if(nid != 0) {
					
					nid--;
					//newCost = costArray[tid]+weightArray[y];
					newCost = ((costArray[tid] >> 20) + weightArray[y]) << 20 | tid+1;


					if(newCost < costArray[nid]) {

						costArray[nid] = newCost;
						//prevArray[nid] = tid+1;
						maskArray[nid] = 1;	
						maskFlag[0] = 1;				
					}
				}
			}
		}
	}
}


/* ======================= SUPER ATOMIC: DETERMINISTIC ====================== */

__kernel void initializeBuffers_super_atomic(	__global int *maskArray,
		                                		__global unsigned int *costArray,
		                                		__global unsigned int *updatingCostArray,
		                                		int sourceVertex,
		                                		int n_vertex) {
	

	for(int tid = get_global_id(0); tid < n_vertex; tid += get_global_size(0)) {

	    if (sourceVertex == tid+1) {

	        maskArray[tid] = 1;
	        costArray[tid] = 0;
	        updatingCostArray[tid] = 0;
	    }
	    else {

	        maskArray[tid] = 0;
	        costArray[tid] = UINT_MAX << 20;
	        updatingCostArray[tid] = UINT_MAX << 20;
	    }
	}
}


__kernel void dijkstra1_super_atomic(	__global int *maskArray,
										__global int *transMatrixArray,
										__global unsigned int *costArray,
										__global unsigned int *updatingCostArray,
				                       	__global int *maskFlag,						
				                        int n_event,
				                        int n_vertex) {

	if(get_global_id(0)==0) maskFlag[0] = 0;

	unsigned int weightArray[12];
	unsigned int newCost;//, n2;
	int nid;

	weightArray[0] = 10;
	weightArray[1] = 15;
	weightArray[2] = 10;
	weightArray[3] = 15;
	weightArray[4] = 10;
	weightArray[5] = 15;
	weightArray[6] = 10;
	weightArray[7] = 15;
	weightArray[8] = 0;
	weightArray[9] = 0;
	weightArray[10] = 0;
	weightArray[11] = 0;


	for(int tid = get_global_id(0); tid < n_vertex; tid += get_global_size(0)) {

		if(maskArray[tid] != 0) {

			maskArray[tid] = 0;

			for(unsigned int y=0; y<n_event; y++) {

				nid = transMatrixArray[tid*n_event+y];

				if(nid != 0) {

					newCost = ((costArray[tid] >> 20) + weightArray[y]) << 20 | tid+1;

					atomic_min(updatingCostArray+nid-1, newCost);					
				}
			}
		}
	}
}


__kernel void dijkstra2_super_atomic(	__global int *maskArray,
				                        __global unsigned int *costArray,
				                        __global unsigned int *updatingCostArray,
				                       	__global int *maskFlag,
				                        int n_vertex) {

	for(int tid = get_global_id(0); tid < n_vertex; tid += get_global_size(0)) {

		if (costArray[tid] > updatingCostArray[tid]) {

	        costArray[tid] = updatingCostArray[tid];
	        maskArray[tid] = 1;
	  	    maskFlag[0] = 1;
    	}

    	updatingCostArray[tid] = costArray[tid];
	}
}


/* ========================== ATOMIC: DETERMINISTIC ========================= */

__kernel void initializeBuffers_atomic(	__global int *maskArray,
                                		__global int *costArray,
                                		__global int *updatingCostArray,
                                		__global int *prevArray,
                                		int sourceVertex,
                                		int n_vertex) {
	


}
                        

__kernel void dijkstra1_atomic(	__global int *maskArray,
								__global int *transMatrixArray,
								__global int *costArray,
								__global int *updatingCostArray,
		                       	__global int *maskFlag,						
		                        int n_event,
		                        int n_vertex) {

 
}


// nota: i 3 kernels sono necessari perche' se avvessi 1 solo kernel in cui salvare direttamente in costArray il newcost vincente, poi nn sarei piu' in grado di capire di risalire a quale thd ha ottenuto quel new_cost vincente. Questo poiche'
__kernel void dijkstra2_atomic(	__global int *maskArray,
								__global int *transMatrixArray,
		                        __global int *costArray,
		                        __global int *updatingCostArray,
								__global int *prevArray,
		                        int n_event,
		                        int n_vertex) {

}

// il terzo kernel ci vuole perche' altrimenti cambierei le carte sotto il naso nel precedente kernel, falsando il risultato alla if(newCost == updatingCostArray[nid]) 
__kernel void dijkstra3_atomic(	__global int *maskArray,
		                        __global int *costArray,
		                        __global int *updatingCostArray,
		                        __global int *maskFlag,
		                        int n_vertex) {


}



/* ====================== MULTI-BUFFERS: DETERMINISTIC ====================== */

__kernel void initializeBuffers_multi(	__global int *maskArray,
										__global unsigned int *updatingCostArray,
										//__global int *updatingPrevArray,
										__global int *updatingMaskFlag,
                                		__global unsigned int *costArray,
	                                	//__global int *prevArray,
	                                	int sourceVertex,
	                                	int n_vertex) { // nxnx21
	

}


__kernel void dijkstra1_multi(	__global int *maskArray,
								__global int *transMatrixArray,
                                __global unsigned int *updatingCostArray,
								//__global int *updatingPrevArray,
								__global int *updatingMaskFlag,
								__global unsigned int *costArray,
                       			__global int *maskFlag,						
                        		int n_event,
                        		int n_vertex) { // nxnx21


}


__kernel void dijkstra2_multi(	__global int *maskArray,
                                __global unsigned int *updatingCostArray,
								//__global int *updatingPrevArray,
								__global int *updatingMaskFlag,
								__global unsigned int *costArray,
								//__global int *prevArray,
								__global int *maskFlag,						
                        		int n_vertex) { // nxn

	

}


