function(foo OUTPUT)
    message(STATUS "ARGC: ${ARGC}")
    message(STATUS "ARGV: ${ARGV}")
    message(STATUS "OUTPUT: ${OUTPUT}")
    message(STATUS "ARGN: ${ARGN}")
    set(${OUTPUT} 123 PARENT_SCOPE)
endfunction()

foo(hello)
FoO(hello world)
foo(hello- world !)
message(STATUS "hello-: ${hello-}")
