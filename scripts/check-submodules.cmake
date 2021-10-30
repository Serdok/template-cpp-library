# Check that Git submodules are all imported if any (No-OP if no submodules)
find_package(Git QUIET)

if (NOT GIT_FOUND)
    return()
endif()

if (NOT EXISTS "${PROJECT_SOURCE_DIR}/.git" AND NOT EXISTS "${PROJECT_SOURCE_DIR}/.gitmodules")
    return()
endif()

execute_process(
        COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        RESULT_VARIABLE GIT_RESULT
)

if (NOT ${GIT_RESULT} EQUAL 0)
    message(FATAL_ERROR "${GIT_EXECUTABLE} submodule update --init --recursive failed with error ${GIT_RESULT}, please checkout submodules")
endif()
