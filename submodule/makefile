all: daddy child user execute clean

daddy: daddy.F90
	gfortran -c daddy.F90

child: child.F90
	gfortran -c child.F90

user: user.F90
	gfortran daddy.o child.o user.F90

execute:
	./a.out

clean:
	rm *.o *.mod *.smod a.out
