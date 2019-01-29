project(qAppTemplate LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(
    Qt5
    COMPONENTS
        Core
        Quick
        REQUIRED
)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/main)
# TODO: add platform-dependent subdirectories

add_executable(${PROJECT_NAME} ${SOURCES} ${RESOURCE})

target_compile_definitions(
    ${PROJECT_NAME}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(
    ${PROJECT_NAME}
    PRIVATE
        Qt5::Core
        Qt5::Quick
)
