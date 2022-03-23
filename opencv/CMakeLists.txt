project(opencv-test CXX)
find_package(OpenCV REQUIRED)

# OpenCV不导出目标，只导出变量，可以用interface library简单地包装一下
add_library(OpenCV INTERFACE)
target_include_directories(OpenCV INTERFACE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(OpenCV INTERFACE ${OpenCV_LIBS})

add_executable(opencv-test source/opencv-test.cpp)
target_link_libraries(opencv-test OpenCV)
