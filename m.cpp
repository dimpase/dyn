#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <vector>
#include <print> // C++23
#include "cmean.h"

namespace py = pybind11;

double cmean(const std::vector<double> &a)
{
  double m;
  m  = mean(a.size(), &a[0]);
  std::println("The mean of a is {}", m);
  return m;
}

PYBIND11_MODULE(dyn, m) {
    m.doc() = "pybind11 dyn plugin"; // optional module docstring
    m.def("cmean", &cmean, "A function that computes mean of a ");
}

