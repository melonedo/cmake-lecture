get_directory_property(START-UP-PROJECT VS_STARTUP_PROJECT)
message(STATUS "START-UP-PROJECT: ${START-UP-PROJECT}")
set_directory_properties(PROPERTIES VS_STARTUP_PROJECT main)
get_directory_property(START-UP-PROJECT VS_STARTUP_PROJECT)
message(STATUS "START-UP-PROJECT: ${START-UP-PROJECT}")
