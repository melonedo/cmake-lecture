cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
project(cmake_and_cuda LANGUAGES CXX CUDA)

# INTERFACE库enable_utf8用于在msvc中启用utf-8
add_library(enable_utf8 INTERFACE)
if(MSVC)
	# cmake的generator expression可以根据语言选择参数，编译c++时使用前者，CUDA使用后者
    target_compile_options(enable_utf8 INTERFACE
        $<$<BUILD_INTERFACE:$<COMPILE_LANGUAGE:CXX>>: /utf-8 >
        $<$<BUILD_INTERFACE:$<COMPILE_LANGUAGE:CUDA>>: -Xcompiler=/utf-8 >
    )
endif()

add_executable(cuda-test calculate.cu main.cpp)
# FIXME: 会把正常的结果当作报错
# add_custom_target(run-cuda-test cuda-test)

# 连接到INTERFACE库enable_utf8即可启用utf-8
target_link_libraries(cuda-test PRIVATE enable_utf8)

# 指定显卡的架构，75代表图灵。
set_target_properties(cuda-test PROPERTIES CUDA_ARCHITECTURES 75)
