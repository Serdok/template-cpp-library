cmake_minimum_required(VERSION 3.20)
project(template_cpp_library
        VERSION 0.0.1)


# Includes
include(GNUInstallDirs)

# Set global parameters
list(PREPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

set(namespace "template")

# Set project parameters / options
option(ENABLE_TESTING "Configure CMake to add tests targets" OFF)
option(BUILD_SHARED_LIBS "Configure CMake to create shared library" OFF)
option(INSTALL_TARGETS "Configure CMake to prepare targets installation" OFF)
add_subdirectory(scripts/)

# Include third-party projects
add_subdirectory(vendor/)

# Create target, link sources
add_subdirectory(src/)

# Define install instructions if requested
if (INSTALL_TARGETS)
    if (DEFINED CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
        message(NOTICE "CMAKE_INSTALL_PREFIX is not set. It will be set to ${PROJECT_BINARY_DIR}/install")
        set(CMAKE_INSTALL_PREFIX  "${PROJECT_BINARY_DIR}/install/" CACHE PATH "Where the library will be installed to" FORCE)
    endif()

    install(TARGETS ${PROJECT_NAME}
            EXPORT "${PROJECT_NAME}Targets"
            PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}"
            INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
            )

    install(EXPORT "${PROJECT_NAME}Targets"
            FILE "${PROJECT_NAME}Targets.cmake"
            NAMESPACE ${namespace}::
            DESTINATION cmake/)
endif()

# Enable testing if requested (or current project is the top-level one)
if (ENABLE_TESTING OR (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME))
    add_subdirectory(tests/)
endif()

