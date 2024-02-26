include=-I /usr/lib64/gfortran/modules/
lib=-lhdf5_fortran

all: test.out

test.out: test.f90
	gfortran $< $(include) $(lib) -o $@

clean:
	rm -f *.out *.o *.mod *.h5
