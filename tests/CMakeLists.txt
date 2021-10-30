# Testing configurations
enable_testing()
include(GoogleTest)

# Executables
add_executable(template_cpp_test)
target_sources(template_cpp_test PRIVATE hello_test.cpp)
target_link_libraries(template_cpp_test PRIVATE template::template_cpp_library gmock gmock_main)

# Discover tests
gtest_discover_tests(template_cpp_test)