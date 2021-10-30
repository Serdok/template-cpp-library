add_library(${PROJECT_NAME})
add_library(${namespace}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

# Set target sources
set(LIB_HEADERS
        "${PROJECT_SOURCE_DIR}/include/template_cpp_library/library.h"
        )
target_sources(${PROJECT_NAME} PRIVATE library.cpp)
target_include_directories(${PROJECT_NAME}
        PRIVATE
            ${PROJECT_SOURCE_DIR}/src
        PUBLIC
            $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        )

# Link external libraries


# Set target properties
set_target_properties(${PROJECT_NAME} PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED TRUE
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        PUBLIC_HEADER ${LIB_HEADERS}
        DEBUG_POSTFIX "-dbg"
        )