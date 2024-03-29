#==============================================================================#
add_library (lib_b OBJECT lib_b.f90)
add_dependencies (lib_b lib_a)
include_directories (${lib_mod_files})

# the include_directories is very important !!!
# without it, lib_b would not recompile if lib_a changes
# did not understand why
#==============================================================================#
