#include <stdio.h>
#include<stdlib.h>
#include <fftw3.h>
#include<complex.h>

int main () {
  int i;
  double *in;
  int N =16384;
  fftw_complex *out;
  fftw_plan plan;
  FILE *inFile, *outFile;
  double scale;
// Memory allocation of in & out arrays
  in = (double*) malloc(sizeof(double)*N);
  out = fftw_malloc(sizeof(fftw_complex)*(N/2+1));

//  Read a input array from a file, an NX by NY array of doubles.
  inFile=fopen("sine.dat", "r");
  for(i = 0; i<N; i++) {
    fscanf(inFile,"%lf\n", &in[i]);
  }

// Starting Foruier transform
  plan = fftw_plan_dft_r2c_1d(N, in, out, FFTW_ESTIMATE);
  fftw_execute_dft_r2c(plan, in, out);
  fftw_destroy_plan(plan);

// writing output data on file (out has Re and Im parts)
  scale=0.0002*(double)N;
  outFile=fopen("out.dat", "w");
  for(i = 0; i<N; i++) {
    fprintf(outFile,"%10.5f %20.12f %20.12f\n",(double)i/scale, out[i][0],out[i][1]);
  }

// deallocation of arrays
  free(in);
  fftw_free(out);
  return 0;
}

