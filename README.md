# Fortran examples

  1. use modern fortran
  2. use tests
  3. use cmake
  
  ## Useful links
  
  * [wiki](http://fortranwiki.org/)
  * [examples](https://github.com/certik/fortran-utils.git)
  * [examples](https://github.com/scivision/fortran2018-examples)
  * [oop](https://gist.github.com/n-s-k)
  
  ## Shared and static libraries
  
  * Shared (or dynamic) library
    ```
    gfortran -c -fPIC one.f90 two.f90
    gfortran -shared one.o two.o -o libmine.so
    ```
  
  * Static library
    ```
    gfortran -c -fPIC one.f90
    gfortran -c -fPIC two.f90
    ar crv libmine.a one.o two.o
    ```
  
  * Link a particular version
    ```
    -l:libdmft.so.1.0.0
    ```
