# Creates a library target called `name` from the given source files.
macro(add_library name)
  if(BUILD_SHARED_LIBS)
    set(LIBTYPE SHARED)
  else()
    set(LIBTYPE STATIC)
  endif()
  add_library(${name} ${LIBTYPE} ${ARGN})
    install(TARGETS ${name}
      COMPONENT ${name}
      LIBRARY DESTINATION lib
      ARCHIVE DESTINATION lib
      RUNTIME DESTINATION bin)
endmacro()
