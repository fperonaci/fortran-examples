exe=exe
lib=lib
mod=mod
obj=obj
src=src

all: build run

build: build_dir $(lib)/libgreets.so $(exe)/a.out

build_dir:
	mkdir -p mod/greets obj/greets exe lib

run:
	./$(exe)/a.out

clean:
	rm -fr $(exe) $(lib) $(mod) $(obj)

greets=$(patsubst $(src)%.f90,$(obj)%.o,$(wildcard $(src)/greets/*))

$(lib)/libgreets.so: $(greets)
	gfortran -shared -o $(lib)/libgreets.so $(greets) -J$(mod)/greets

$(obj)/greets/%.o: $(src)/greets/%.f90
	gfortran -c -fPIC $< -o $@ -J$(mod)/greets

$(exe)/a.out: $(src)/main/main.f90 $(lib)/libgreets.so
	gfortran $< -o $@ -J $(mod)/greets -L $(lib) -lgreets -Wl,-rpath=lib

 	#LD_LIBRARY_PATH=lib ./$(exe)/a.out
	#LD_RUN_PATH=lib gfortran $< -o $@ -J $(mod)/greets -L $(lib) -lgreets
