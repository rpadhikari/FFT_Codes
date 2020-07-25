FC=gfortran -c
LD=gfortran
FFTROOT=/usr/local
INCLUDE=$(FFTROOT)/include
LIB=$(FFTROOT)/lib
FLAG=-lfftw3
SRC=fft.f90
OBJ=fft.o

fft:
	$(FC) $(SRC) -I$(INCLUDE)
	$(LD) $(OBJ) -o fft.x -L$(LIB) $(FLAG)
	rm -rf $(OBJ)
clean:
	rm -rf fft.x $(OBJ) out.dat *.o
run:
	./fft.x

