set(__SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/cpp")

include_directories(${__SOURCE_DIR})

list(REMOVE_ITEM SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/../main/src/main.cpp)

set(
    HEADER
        "${__SOURCE_DIR}/TestExample.hpp"
    PARENT_SCOPE
)

set(RESOURCE "${CMAKE_CURRENT_LIST_DIR}/qml/test.qrc" PARENT_SCOPE)

set(
    SOURCE
        "${__SOURCE_DIR}/main.cpp"
        "${__SOURCE_DIR}/TestExample.cpp"
    PARENT_SCOPE
)
