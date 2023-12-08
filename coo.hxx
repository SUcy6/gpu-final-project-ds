#include <utility>
#include <vector>

template<typename weight_t> class coo{
    /* whether nodes i exits, v_d[i] == 1 means node i is in the graph*/
    bool *v_d;
    /* source of each edge */
    size_t *row_idx_d;
    /* target of each edge */
    size_t *col_idx_d;
    /* wegith of each edge*/
    weight_t *value_d;
    /* number of vertices */
    size_t v_num_d;
    /* number of edges */
    size_t e_num_d;
    /* max number of nodes */
    size_t MAX_d;
    /* deleted slots in the row_idx_d */
    size_t *deleted_d;
    /* head of the deleted_d */
    size_t head;
    /* tail of the deleted_d */
    size_t tail;

public:
    /*s
    1
    */
    __host__ 
    void init(size_t* v_list_t ,size_t v_num_t ,size_t* row_idx_t ,size_t* col_idx_t ,size_t* value_t ,size_t e_num_t ,size_t MAX){
        cudaMalloc();
        cudaMalloc();
        cudaMalloc();
    }

    __device__
    void init_d(){}

    /* 2 return the number of vertices, and this function is called on host */
    __host__
    size_t get_number_of_vertices() {
        size_t res;
        cudaMemcpy(&res, v_num_d, sizeof(size_t), cudaMemcpyDeviceToHost);
        return res;
    }

    /* 3 return the number of edges, and this function is called on host */
    __host__
    int get_number_of_edges(){
        size_t res;
        cudaMemcpy(&res, e_num_d, sizeof(size_t), cudaMemcpyDeviceToHost);
        return res;
    }
//     /*
//     4
//     */
    __host__ __device__
    int get_num_neighbors(vertex_type x){
        size_t in_num = get_in_degree(x);
        size_t out_num = get_out_degree(x);
        return in_num + out_num;
    }

    // /*
    // 1
    // */
    // void set(){

    // }
    // /*
    // 2
    // */
    // vertex_t get_source_vertex(){

    // }
    // /*
    // 3
    // */
    // vertex_t get_destination_vertex(){

    // }
    // /*
    // 2
    // */
    // edge_t get_weight(edge_t){

    // }
    // /*
    // 3
    // */
    int get_in_degree(vertex_t){
        size_t num;
        // kernel: for each atomic add, *col_idx_d;
    }
    // /*
    // 4
    // */
    int get_out_degree(vertex_t){
         size_t num;
        // kernel: for each atomic add, *row_idx_d;       
    }
    // /*
    // 1
    // */
    // edge_t insert_edge(edge_t){

    // }
    // /*
    // 2
    // */
    // vertex_t insert_vertex(edge_t ){

    // }
    // /*
    // 3
    // */
    // edge_t delete_edge(edge_t){

    // }
    // /*
    // 4
    // */
    vertex_t delete_vertex(vertex_t *v_del){
        for(auto v : v_del) {
            v_d[v] = 0;
        }
        // kernel 1 : v_d from 1 to 0
        // kernel 2 : *row_idx_d and *col_idx_d; find the vertex to delete 
        //            from value to -1

    }
};