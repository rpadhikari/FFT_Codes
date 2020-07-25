/* Mixed sine waves with little noise
! Author: Rajendra Adhikari
! Deartment of Physics, Kathmandu University
! date: 25th July, 2020 */

#include<stdio.h>
#include<math.h>
#define pi 3.14159265358979320 // value of Pi

int main() {
  int N=16384;
  double x, w1, w2, w3, w4;

// Frequencies corresponding to 50, 100, 150 and 200 Hz 
  double f1=50.0, f2=100.0, f3=150.0, f4=200.0;
  FILE *outFile;
// angular frequencies
  w1=2.0*pi*f1;
  w2=2.0*pi*f2;
  w3=2.0*pi*f3;
  w4=2.0*pi*f4;

// outfile for storing elements of out array
  outFile=fopen("sine.dat", "w");
  for(int i=0; i<N; i++) {
    x=(double)i*0.00020;
    fprintf(outFile,"%15.8f\n", 20.0*sin(w1*x)+10.0*sin(w2*x)+5.0*sin(w3*x)+2.50*sin(w4*x));
  }
  fclose(outFile);

  return 0;
}

