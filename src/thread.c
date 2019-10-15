#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

#define N 100000
#define T 4

int sum = 0;

void *array_sum(void *arg)
{
    for (int i = 0; i < N/T; i++)
        sum += ((int*)arg)[i];
    pthread_exit(NULL);
}

int main()
{
    pthread_t t[T];
    int A[N];

    for (int i = 0; i < N; i++)
        A[i] = rand()%10;

    for (int i = 0; i < T; i++)
        pthread_create(&t[i], NULL, array_sum, &A[i*N/T]);

    for (int i = 0; i < T; i++)
        pthread_join(t[i], NULL);

    printf("%d\n", sum);    // 448706
    return 0;
}
