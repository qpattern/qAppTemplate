QT += testlib
QT -= gui

CONFIG += testcase

# --coverage option is synonym for: -fprofile-arcs -ftest-coverage -lgcov
QMAKE_CXXFLAGS += --coverage
QMAKE_LFLAGS += --coverage

INCLUDEPATH += $$PWD/cpp

HEADERS += \
    $$PWD/cpp/TestExample.hpp

# Remove the run main
SOURCES -= $$find(SOURCES, main.cc)

SOURCES += \
    $$PWD/cpp/main.cpp \
    $$PWD/cpp/TestExample.cpp

RESOURCES += \
    $$PWD/qml/qml.qrc
