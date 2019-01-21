#ifndef __TEST_EXAMPLE_HPP__
#define __TEST_EXAMPLE_HPP__

#include <QObject>
#include <QTest>

class TestExample: public QObject
{
    Q_OBJECT

private slots:
    // functions executed by QtTest before and after test suite
    void initTestCase();
    void cleanupTestCase();

    // functions executed by QtTest before and after each test
    void init();
    void cleanup();

    // Tests
    void test1();
    void test2();
};
#endif // __TEST_EXAMPLE_HPP__
