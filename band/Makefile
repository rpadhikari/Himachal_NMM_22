FC=gfortran -c
LD=gfortran
SRC=distance.f90 main.f90
OBJ=distance.o main.o
distance:
	$(FC) $(SRC)
	$(LD) $(OBJ) -o distance.x
	rm -rf *.o
clean:
	rm -rf *.o distance.x

