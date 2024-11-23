# Creates an executable target called `name` from the given source files.
macro(add_executable name)
  add_executable(${name} ${ARGN} )   
  install(TARGETS ${name}
        COMPONENT ${name}
        RUNTIME DESTINATION bin)
endmacro()