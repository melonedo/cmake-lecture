set(var "hello")
message(STATUS ${var})
message(STATUS "${var} world")
message(STATUS "Not set: ${notset}")
