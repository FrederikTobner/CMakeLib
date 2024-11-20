# Define a function to print a formatted message
function(print_option name value)
    # Calculate the padding needed to align the values
    set(padding_length 50) # Adjust the number of spaces as needed
    string(LENGTH "${name}" name_length)
    math(EXPR pad_length "${padding_length} - ${name_length}")
    if (pad_length GREATER 0)
        string(REPEAT " " ${pad_length} pad)
    else()
        set(pad " ")
    endif()
    message("-- ${name}${pad}: ${value}")
endfunction()

# Creates an option with the given name, description, and default value and prints its value during the configuration of cmake.
macro(add_option name description default_value)
    if (NOT "${ARGN}" STREQUAL "")
        message(SEND_ERROR "add_option takes only three arguments. Offending args: ${ARGN}")
    endif()
    option(${name} ${description} ${default_value})
    print_option(${name} ${${name}})
endmacro()