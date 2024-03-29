#==============================================================================#
# put all .mod files here
set (CMAKE_Fortran_MODULE_DIRECTORY ${lib_mod_files})

set (soversion 1)

# build library components ..
add_subdirectory (lib_a)
add_subdirectory (lib_b)

# .. and put them together
add_library (lib SHARED
             $<TARGET_OBJECTS:lib_a>
             $<TARGET_OBJECTS:lib_b>)

set_target_properties (lib PROPERTIES SOVERSION ${soversion})

# install instructions
install (TARGETS lib DESTINATION lib)
install (DIRECTORY ${lib_mod_files}/ DESTINATION include/lib.${soversion})
install (DIRECTORY ${lib_mod_files}/ DESTINATION include/lib)
#==============================================================================#
