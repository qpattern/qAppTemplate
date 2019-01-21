#include <QGuiApplication>
#include <QtTest>

#include "TestExample.hpp"

#define T(t, count) {\
    t test; \
    count += QTest::qExec(&test, argc, argv); \
}

int main(int argc, char** argv) {
    QGuiApplication app(argc, argv);

    int failedCount = 0;

    T(TestExample, failedCount);

    return failedCount;
}