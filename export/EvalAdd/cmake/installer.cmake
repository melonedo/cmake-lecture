### eval_add/cmake/installer.cmake ###
include(GNUInstallDirs)
# 版本号为项目版本，生成版本文件
include(CMakePackageConfigHelpers)
write_basic_package_version_file(EvalAddConfigVersion.cmake
    VERSION ${eval_add_VERSION}
    COMPATIBILITY SameMajorVersion)

# （配置并）安装XXXConfig.cmake
if (EXPORT_VARIABLES)
    configure_package_config_file(cmake/EvalAddConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/EvalAddConfig.cmake # 和下面一样
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/EvalAdd # 和下面一样
        PATH_VARS CMAKE_INSTALL_INCLUDEDIR)
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/EvalAddConfigVersion.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/EvalAdd)
else()
    install(FILES 
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EvalAddConfig.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/EvalAdd)
endif()
# 安装对应的版本文件
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/EvalAddConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/EvalAdd)
# 安装生成的二进制文件，用默认配置即可
install(TARGETS eval_add EXPORT EvalAddTargets)
# 安装本项目的目标
install(EXPORT EvalAddTargets
    FILE EvalAddTargets.cmake
    NAMESPACE EvalAdd:: # 命名空间
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/EvalAdd)
# 安装头文件
install(DIRECTORY include/eval_add TYPE INCLUDE)
