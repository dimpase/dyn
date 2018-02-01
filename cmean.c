int someconst = 42;

__attribute__((visibility("default"))) double mean(int n, double* a)
{
  double s;
  int i;
  for (s=0., i=0; i<n; i++) s+=*(a++);
  return someconst*s/n;
}
