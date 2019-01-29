set(__SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/cpp")

include_directories(${__SOURCE_DIR})

set(
    SOURCES
        "${__SOURCE_DIR}/main.cpp"
    PARENT_SCOPE
)

set(RESOURCE "${CMAKE_CURRENT_LIST_DIR}/qml/main.qrc" PARENT_SCOPE)
