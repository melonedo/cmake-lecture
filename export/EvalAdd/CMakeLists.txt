### eval_add/CMakeLists.txt ###
cmake_minimum_required(VERSION 3.13)
# 少写个C语言省点配置的时间
project(eval_add VERSION 0.0.1 LANGUAGES CXX)

# 提供CMAKE_INSTALL_INCLUDEDIR
include(GNUInstallDirs)
# 外部依赖
find_package(Boost REQUIRED COMPONENTS regex)

# 定义库，没什么特别的
add_library(eval_add SHARED source/eval_add.cpp)
target_link_libraries(eval_add PRIVATE Boost::dynamic_linking Boost::boost Boost::regex Boost::diagnostic_definitions)
if(MSVC)
    target_compile_options(eval_add PRIVATE $<BUILD_INTERFACE:/utf-8>)
endif()

# 需要区分编译和安装，安装后包含路径只是一个简单的include
target_include_directories(eval_add
  PUBLIC
    $<BUILD_INTERFACE:${eval_add_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

set_target_properties(eval_add PROPERTIES
    CXX_STANDARD 11
    WINDOWS_EXPORT_ALL_SYMBOLS ON # 懒得写__declspec
    DEBUG_POSTFIX -debug # 添加一个后缀区分不同的configuration
)
# 见下
include(cmake/installer.cmake)
