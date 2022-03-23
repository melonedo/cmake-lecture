cmake_minimum_required(VERSION 3.0)
project(hello LANGUAGES CXX)
add_executable(hello source/hello.cpp)
add_custom_target(run-hello hello)
