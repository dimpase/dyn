#include <stdlib.h>
#include <stdio.h>
#include "cmean.h"

int main()
{
  double m, *v;
  v = (double*)malloc(2*sizeof(double));
  v[0] = 5.2;
  v[1] = 7.9;
  m  = mean(2, v);
  printf("The mean of %3.2f and %3.2f is %3.2f\n", v[0], v[1], m);
  free(v);
  return 0;
}
