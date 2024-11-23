# Compile shaders from glsl to SPIR-V
macro(compile_shaders_to_spirv target_name)
    set(shader_output_files "")
    foreach(shader ${ARGN})
        get_filename_component(shader_name ${shader} NAME_WE)
        get_filename_component(shader_extension ${shader} LAST_EXT)
        string(SUBSTRING ${shader_extension} 1 -1 shader_extension)
        set(output_file "${CMAKE_CURRENT_BINARY_DIR}/${shader_name}_${shader_extension}.spv")
        add_custom_command(
            TARGET ${target_name}
            PRE_BUILD
            COMMAND glslc ${shader} -o ${output_file}
            COMMENT "Compiling ${shader_name} shader to SPIR-V (${output_file})"
            VERBATIM
        )
        message(STATUS "Compiling ${shader} to SPIR-V (${output_file})")
    endforeach()
endmacro()