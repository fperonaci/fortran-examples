#==============================================================================#
cmake_minimum_required(VERSION 3.11)

enable_language (Fortran)

# read who i am and pass it to fortran preprocessor
# can be used for instance to stamp the git hash
execute_process (COMMAND whoami OUTPUT_VARIABLE me)
string (REGEX REPLACE "\n$" "" me "${me}")
add_definitions (-DMY_SELF="${me}")
set (CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -cpp")

# install directory
set (CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install)

# put here .mod files
set (lib_mod_files ${CMAKE_BINARY_DIR}/lib/mod_files)

# build the library lib
add_subdirectory (lib)

# build the executable main which uses lib
add_subdirectory (main)

# another library
add_subdirectory (foo)
#==============================================================================#
