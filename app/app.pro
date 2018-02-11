TARGET = qtAppTemplate

QT += quick

CONFIG += c++11

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
    CONFIG(MOCK) {
        message("The build contains mock data")

        include($$PWD/src/mock/mock.pri)
    }
}
