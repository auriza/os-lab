/*
 * Pi Approximation
 *   - pi ~= integral 4 / (1 + x^2) from 0 to 1
 *   - numerical integration using midpoint rule
 *   - http://www.wolframalpha.com/input/?i=midpoint+rule+4%2F(1%2Bx^2)+from+0+to+1+with+5+intervals
 */

#include <stdio.h>
#include <math.h>
#include <time.h>

int main()
{
    int             a, b;
    long long       n, i;
    long double     x, y, dx, area;
    struct timespec t1, t2;

    n  = 100000000;                     // number of intervals (rectangles)
    a  = 0;                             // integral lower limit
    b  = 1;                             // integral upper limit
    dx = (double) (b-a) / n;            // interval's width
    area = 0.0;                         // sum of midpoint area

    clock_gettime(CLOCK_REALTIME, &t1);
    for (i = 0; i < n; i++) {
        x = a + (i + 0.5) * dx;         // interval's midpoint
        y = (4.0 / (1.0 + x*x));        // interval's height --> f(x) = 4 / (1+x^2)
        area += y * dx;                 // interval's area
    }
    clock_gettime(CLOCK_REALTIME, &t2);

    printf("   Pi: % .16Lf\n", area);
    printf("Error: % .16Lf\n", area - M_PI);
    printf(" Time: % .3fs\n", (t2.tv_sec - t1.tv_sec) + (t2.tv_nsec - t1.tv_nsec)/1e9);
    return 0;
}
