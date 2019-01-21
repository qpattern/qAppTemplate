QT += testlib

CONFIG += testcase

INCLUDEPATH += $$PWD/cpp

HEADERS += \
    $$PWD/cpp/TestExample.hpp

# Remove the run main
SOURCES ~= s/\s?.*main\.cpp//

SOURCES += \
    $$PWD/cpp/main.cpp \
    $$PWD/cpp/TestExample.cpp

RESOURCES += \
    $$PWD/qml/qml.qrc
