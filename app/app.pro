TARGET = qtAppTemplate

QT += quick

CONFIG += c++11

VER_MAJ = 0
VER_MIN = 0
VER_PAT = 1
VERSION = $$sprintf("%1.%2.%3", $$VER_MAJ, $$VER_MIN, $$VER_PAT)

include($$PWD/src/main/main.pri)

android {
    message("Android build")

    include($$PWD/src/android/android.pri)

} else:ios {
    message("iOS build")

    include($$PWD/src/ios/ios.pri)

} else:linux {
    message("Linux build")

    include($$PWD/src/desktop/desktop.pri)
    include($$PWD/src/linux/linux.pri)

} else:osx {
    message("osX build")

    include($$PWD/src/desktop/desktop.pri)
    include($$PWD/src/osx/osx.pri)

} else:win32 {
    message("Win32 build")

    include($$PWD/src/desktop/desktop.pri)
    include($$PWD/src/win32/win32.pri)
}

CONFIG(debug, debug|release) {
    message("Debug build")

    DEFINES += $$sprintf("APP_VERSION=\\\"%1_d\\\"", $$VERSION)

    CONFIG(MOCK) {
        message("The build contains mock data")

        include($$PWD/src/mock/mock.pri)
    }

    CONFIG(TEST) {
        message("Unit test")

        include($$PWD/src/test/test.pri)
    }
}

CONFIG(release, debug|release) {
    message("Release build")

    DEFINES += QT_NO_DEBUG_OUTPUT
    DEFINES += QT_NO_INFO_OUTPUT

    DEFINES += $$sprintf("APP_VERSION=\\\"%1\\\"", $$VERSION)
}
