double mean(int n, double* a) 
{
  double s;
  int i;
  for (s=0., i=0; i<n; i++) s+=*(a++);
  return s/n;
}
