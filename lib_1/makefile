all: build link run clean

build:
	@echo === Build the two libraries ===
	gfortran -fPIC -c ciao_v1.f90
	gfortran -fPIC -c ciao_v2.f90
	gfortran -shared ciao_v1.f90 -o libmine.so.1
	gfortran -shared ciao_v2.f90 -o libmine.so.2

link:
	@echo === Link two different executables ===
	gfortran main.f90 -L . -l:libmine.so.1 -o exe_1.out
	gfortran main.f90 -L . -l:libmine.so.2 -o exe_2.out

run:
	@echo === Run ===
	LD_LIBRARY_PATH=. ./exe_1.out
	LD_LIBRARY_PATH=. ./exe_2.out

clean:
	@echo === Clean ===
	rm -f *.o *.mod *.so* *.out
