#include <vector>
#include <print>
#include <iostream>
#include "cmean.h"

int main()
{
  double m;
  std::vector<double> v;
  v.push_back(5.2);
  v.push_back(7.9);
  m  = mean(2, &v[0]);
  std::println("The mean of {0} and {1} is {2}", v[0], v[1], m);
  return 0;
}
