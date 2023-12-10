#include "graph.hxx"
#include "coo.hxx"
#include <iostream>
#include <vector>
#include <time.h>

int main(){
    /* set the random seed and clock */
    srand(time(0));
    double time_taken;
    clock_t start, end;
    clock_t T_start, T_end;

    /* initialize an empty graph*/
    graph<int,coo> g;
    size_t v_list[] = {};
    size_t v_num = 0;
    size_t row_idx[] = {};
    size_t col_idx[] = {};
    int value[] = {};
    size_t e_num = 0;
    size_t number_of_blocks = 50;
    size_t threads_per_block = 256;
    size_t MAX = 10000;
    size_t test_times = 10000;

    /* print the initial graph we input */
    printf("The initial graph we input: \n");
    printf("v_list: ");
    for(int i = 0; i < v_num; i++){
        printf("%lu ", v_list[i]);
    }
    printf("\n");
    
    printf("row_idx: ");
    for(int i = 0; i < e_num; i++){
        printf("%lu ", row_idx[i]);
    }
    printf("\n");
    
    printf("col_idx: ");
    for(int i = 0; i < e_num; i++){
        printf("%lu ", col_idx[i]);
    }
    printf("\n");
    
    printf("value: ");
    for(int i = 0; i < e_num; i++){
        printf("%d ", value[i]);
    }
    printf("\n");

    printf("\n ----------------------------Test begin------------------------------------\n");

    /* test initialization */
    T_start = clock();
    start = clock();
    g.init(v_list, v_num, row_idx, col_idx, value, e_num, number_of_blocks, threads_per_block, MAX);
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("initialization: %lf s\n", time_taken);

    /* insert test_times edges */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.insert_vertex(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("insert %d vertices: %lf s\n", test_times, time_taken);

    /* insert test_times edges */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.insert_edge(rand() % MAX, rand() % MAX, rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("insert %d edges: %lf s\n", test_times, time_taken);

    /* check test_times edges */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.check_edge(rand() % MAX, rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("check %d edges: %lf s\n", test_times, time_taken);

    /* check test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.check_vertex(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("check %d vertices: %lf s\n", test_times, time_taken);

    /* get weight*/
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_weight(rand() % MAX, rand() % MAX, -1);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get weight of %d edges: %lf s\n", test_times, time_taken);

    /* get in degree of test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_in_degree(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get in degree of %d vertices: %lf s\n", test_times, time_taken);

    /* get out degree of test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_out_degree(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get out degree of %d vertices: %lf s\n", test_times, time_taken);

    /* get number of neighbors test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_num_neighbors(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get num of neighbors of %d vertices: %lf s\n", test_times, time_taken);

    /* get source of test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_source_vertex(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get source of %d vertices: %lf s\n", test_times, time_taken);

    /* get destination of test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.get_destination_vertex(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("get destination of %d vertices: %lf s\n", test_times, time_taken);

    /* delete test_times edges */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.delete_edge(rand() % MAX, rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("delete %d edges: %lf s\n", test_times, time_taken);

    /* delete test_times vertices */
    start = clock();
    for (int i = 0; i < test_times; i ++) {
        g.delete_vertex(rand() % MAX);
    }
    end = clock();
    time_taken = ((double)(end - start))/ CLOCKS_PER_SEC;
    printf("delete %d vertices: %lf s\n", test_times, time_taken);

    T_end = clock();
    time_taken = ((double)(T_end - T_start))/ CLOCKS_PER_SEC;
    printf("Total time: %lf s\n", time_taken);

    // /* test print*/
    // g.print();

    // /* 2 test get number of vertices and edges */
    // printf("\ntest get number of vertices and edges\n");
    // printf("number of vertices: %lu, ", g.get_number_of_vertices());
    // printf("number of edges: %lu\n", g.get_number_of_edges());


    printf("----------------------------Test end---------------------------------------\n");

    return 0;
}