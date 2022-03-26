cmake_minimum_required(VERSION 3.0)
project(add LANGUAGES C CXX)

add_library(add SHARED)
target_sources(add PRIVATE source/add.c)
target_include_directories(add PUBLIC include)

include(GenerateExportHeader)
generate_export_header(add)
target_include_directories(add PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

add_executable(test-add-c source/test-add.c)
target_link_libraries(test-add-c PRIVATE add)

set_property(DIRECTORY "${PROJECT_SOURCE_DIR}" PROPERTY VS_STARTUP_PROJECT test-add-c)
add_custom_target(run-test-add-c test-add-c)

add_executable(test-add-cpp source/test-add.cpp)
target_link_libraries(test-add-cpp PRIVATE add)
add_custom_target(run-test-add-cpp test-add-cpp)


#[[
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/configure-python.cmake
    "configure_file(${CMAKE_CURRENT_SOURCE_DIR}/source/test-add.py ${CMAKE_CURRENT_BINARY_DIR}/test-add.py)")

add_custom_command(OUTPUT test-add.py VERBATIM
    COMMAND ${CMAKE_COMMAND} -D LIBADD_PATH=$<TARGET_FILE:add> -P ${CMAKE_CURRENT_BINARY_DIR}/configure-python.cmake)
]]

file(GENERATE OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/test-add-$<CONFIG>.py INPUT ${CMAKE_CURRENT_SOURCE_DIR}/source/test-add.py)

find_package(Python3 COMPONENTS Interpreter)

add_custom_target(run-test-add-python COMMAND Python3::Interpreter test-add-$<CONFIG>.py)
