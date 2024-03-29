#==============================================================================#
include_directories (${lib_mod_files})
add_executable (main main.f90)
target_link_libraries (main lib)

add_custom_command (TARGET main COMMAND echo ciao > /home/fp/Desktop/bella)
#==============================================================================#
