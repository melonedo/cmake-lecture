### eval_add/cmake/EvalAddConfig.cmake ###
include(CMakeFindDependencyMacro)
# 似乎不需要写REQUIRED
find_dependency(Boost COMPONENTS regex)
include("${CMAKE_CURRENT_LIST_DIR}/EvalAddTargets.cmake")
