set(var hello world)
message(STATUS ${var})
message(STATUS "${var}")

list(JOIN var * joined)
message(STATUS "${joined}")

set(escape "hello\;world")
message(STATUS ${escape})
