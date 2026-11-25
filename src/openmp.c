#include <stdio.h>

int main() {

    #pragma omp parallel num_threads(32)
    puts("Hello");

    return 0;
}
