
#include <cassert>
#include <tuple>

#include <coo.hxx>

template<
    typename vertex_t,
    typename edge_t,
    typename weight_t,
    class... graph_view_t> class graph {

public:
    graph_view_t graph_t;

    __host__ __device__
    vertex_t get_number_of_vertices() const {
        return graph_t.get_number_of_vertices();
    }

    __host__ __device__
    edge_t get_number_of_edges(){
        return graph_t.get_number_of_edges();
    }

    vertex_t get_source_vertex(){

    }

    vertex_t get_destination_vertex(){

    }

    edge_t get_edge(edge_t){

    }

    vertex_t get_vertex(vertex_t){

    }

    edge_t get_weight(edge_t){

    }

    int get_in_degree(vertex_t){

    }

    int get_out_degree(vertex_t){

    }

    edge_t insert_edge(edge_t){

    }

    vertex_t insert_vertex(edge_t){

    }

    edge_t delete_edge(edge_t){

    }

    vertex_t deete_vertex(vertex_t){
        
    }

};