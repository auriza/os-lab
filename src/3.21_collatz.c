#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void collatz(int n)
{
    printf("%d ", n);

    if (n <= 1)
        return;
    else if (n % 2 == 0)
        collatz(n / 2);
    else
        collatz(3 * n + 1);
}


int main()
{
    int pid;
    int n;

    scanf("%d", &n);

    pid = fork();

    if (pid == 0)
        collatz(n);
    else
        wait(NULL);

    return 0;
}
