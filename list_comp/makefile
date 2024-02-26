all: run clean

run: a.out
	./a.out

a.out: foo.f90
	gfortran $(flags) -o $@ $<

clean:
	rm -f a.out
