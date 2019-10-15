#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <fcntl.h>

void *shm_ptr;

void collatz(int n)
{
    shm_ptr += sprintf(shm_ptr, "%d ", n);

    if (n <= 1)
        return;
    else if (n % 2 == 0)
        collatz(n / 2);
    else
        collatz(3 * n + 1);
}

int main()
{
    pid_t pid;
    int shm_fd;
    int n;

    shm_fd  = shm_open("collatz", O_CREAT | O_RDWR, 0666);
    ftruncate(shm_fd, 4096);
    shm_ptr = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);

    scanf("%d", &n);

    pid = fork();

    if (pid == 0) {
        collatz(n);
    } else {
        wait(NULL);
        printf("%s", (char *)shm_ptr);
        shm_unlink("collatz");
    }

    return 0;
}
