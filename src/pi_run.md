$ time ./pi
   Pi: 3.1415926535897926
Error: -0.0000000000000005
 Time: 6.787s

real    0m6.789s
user    0m6.784s
sys 0m0.004s

$ time ./pi
   Pi: 3.1415926535897926
Error: -0.0000000000000005
 Time: 6.782s

real    0m6.784s
user    0m6.780s
sys 0m0.000s

$ time ./pi
   Pi: 3.1415926535897926
Error: -0.0000000000000005
 Time: 6.768s

real    0m6.770s
user    0m6.768s
sys 0m0.000s

$ time ./pi_thread
   Pi: 3.1415926535897930
Error: -0.0000000000000001
 Time: 1.944s

real    0m1.946s
user    0m7.772s
sys 0m0.000s

$ time ./pi_thread
   Pi: 3.1415926535897930
Error: -0.0000000000000001
 Time: 1.946s

real    0m1.948s
user    0m7.748s
sys 0m0.000s

$ time ./pi_thread
   Pi: 3.1415926535897930
Error: -0.0000000000000001
 Time: 1.863s

real    0m1.864s
user    0m7.404s
sys 0m0.000s

Intel(R) Xeon(R) CPU E3-1220 v3 @ 3.10GHz
rataan  6.779   1.918   3.54    88.4%
