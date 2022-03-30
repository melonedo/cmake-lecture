cmake_minimum_required(VERSION 3.13)
project(use_eval_add VERSION 0.0.1 LANGUAGES CXX)

find_package(EvalAdd)

add_executable(use-eval-add main.cpp)
target_link_libraries(use-eval-add EvalAdd::eval_add)

add_custom_command(TARGET use-eval-add POST_BUILD COMMAND_EXPAND_LISTS
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:use-eval-add> $<TARGET_FILE_DIR:use-eval-add>)

add_custom_target(run-use-eval-add use-eval-add)

include(GNUInstallDirs)
install(TARGETS use-eval-add)
set_target_properties(use-eval-add PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
install(FILES $<TARGET_RUNTIME_DLLS:use-eval-add> TYPE BIN)
