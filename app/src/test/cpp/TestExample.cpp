#include "TestExample.hpp"

#include <QDebug>

void TestExample::initTestCase()
{
    qDebug() << "Called before everything else.";
}

void TestExample::cleanupTestCase()
{
    qDebug() << "Called after test1 and test2.";
}

void TestExample::init()
{
    qDebug() << "Called before each test.";
}

void TestExample::cleanup()
{
    qDebug() << "Called after each test.";
}

void TestExample::test1()
{
    QVERIFY(true); // check that a condition is satisfied
    QCOMPARE(1, 1); // compare two values
}

void TestExample::test2()
{
    QVERIFY(1 != 2);
}
