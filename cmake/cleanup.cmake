# Remove SMS value from the cache so cmake .. will use default rather than last run
unset(SMS CACHE)

message("Generated with CMAKE_BUILD_TYPE types: ${CMAKE_BUILD_TYPE}")
message("Generated with config types: ${CMAKE_CONFIGURATION_TYPES}")
