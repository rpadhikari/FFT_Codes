FTN = gfortran
FFTROOT = /usr/local
INCLUDE = $(FFTROOT)/include
LIB = $(FFTROOT)/lib
FLAG = -lfftw3

myfft:	myfft.o
	$(FTN) myfft.o -o $@ -L$(LIB) $(FLAG)

myfft.o: myfft.f90
	$(FTN) -O -c myfft.f90 -I$(INCLUDE) -L$(LIB) $(FLAG)

run :
	myfft
