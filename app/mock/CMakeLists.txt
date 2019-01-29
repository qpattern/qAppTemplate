set(__SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/cpp")

include_directories(${__SOURCE_DIR})

add_compile_definitions(QP_MOCK)

set(RESOURCE "${CMAKE_CURRENT_LIST_DIR}/qml/mock.qrc" PARENT_SCOPE)
