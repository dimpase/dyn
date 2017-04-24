cdef extern from "cmean.h":
   double mean(int, double*)

from stdlib cimport *
# from libc.stdlib cimport *

def cmean(a):
  n = len(a)
  cdef double *v
  v = <double *>malloc(n*sizeof(double))
  for i in range(n):
     v[i] = float(a[i])
  m  = mean(n, v)
  print "The mean of ", a, " is ", m 
  free(v)
  return m
