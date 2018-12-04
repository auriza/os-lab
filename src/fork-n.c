#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

#define NCHILD 9

int main()
{
    int i;

    for (i = 0; i < NCHILD; i++) {
        if (fork() == 0) {
            puts("Hello");
            return 0;
        }
    }

    for (i = 0; i < NCHILD; i++) {
        wait(NULL);
    }

    return 0;
}
