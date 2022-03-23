cmake_minimum_required(VERSION 3.12)
project(boost-test)
find_package(Boost REQUIRED COMPONENTS thread)

add_executable(boost-test test.cpp)
# 用CMake的时候不需要用#comment(lib, "...")自动连接，而且这样有时会自动给静态库加lib前缀，不适配某些版本（如1.74）的Windows下预编译库的名字。
target_link_libraries(boost-test Boost::thread Boost::disable_autolinking Boost::diagnostic_definitions)

# Please define _WIN32_WINNT or _WIN32_WINDOWS
if(MSVC)
target_precompile_headers(boost-test PRIVATE <SDKDDKVer.h>)
endif()

add_custom_target(run-boost-test boost-test)
