CC=gcc -c
LD=gcc
FFTROOT=/usr/local
INCLUDE=$(FFTROOT)/include
LIB=$(FFTROOT)/lib
FLAG=-lfftw3
SRC=r2c.c
OBJ=r2c.o

fft:
	$(CC) $(SRC) -I$(INCLUDE)
	$(LD) $(OBJ) -o fft.x -L$(LIB) $(FLAG) -lm
	rm -rf $(OBJ)
clean:
	rm -rf fft.x $(OBJ) out.dat *.o
run:
	./fft.x

