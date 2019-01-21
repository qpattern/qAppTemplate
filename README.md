# Qt app folder structure template

Having a common directory layout would allow for users familiar with one project
to immediately feel at home with another one. I’m sure there are many good ways
of doing this, but this is the source tree setup I always use:

```txt
<project root>
├── .build
├── app
│   ├── app.pro
│   └── src
│       ├── android
│       ├── desktop
│       ├── ios
│       ├── linux
│       ├── main
│       |   ├── main.pri
│       |   ├── cpp
│       |   |   └── main.cpp
│       |   ├── js
│       |   ├── qml
│       |   |   ├── main.qml
│       |   |   └── main.qrc
│       |   └── resources
│       ├── mock
│       ├── osx
│       ├── test
│       └── win32
├── doc
├── libs
│     .3 libs.pro
└── <project name>.pro
```

The _.build_ directory will contain the files generated by the build process, and everything in there is not tracked and esplicitly ignored.

The _app_ folder contains the source code of the app itself, _doc_ contains the
documentation, and _libs_ contains the libraries. The source of the app is
divided into subfolders:

* _android_: contains the source code and resources specific for the Android platform, it also contains xml and java files;
* _desktop_: contains the source code and resources shared among desktop platforms (Linux/macOS/Windows);
* _ios_: contains the source code and resources specific for the iOS platform, it also contains objective c code;
* _linux_: contains the source code and resources specific for the Linux platform;
* _main_: contains the source code and resources shared among all platforms;
* _mock_: contains sources and resources used to mock data inside the app;
* _osx_: contains the source code and resources specific for the macOS platform;
* _test_: contains the source code for the tests of the app;
* _win32_: contains the source code and resources specific for the Windows platform.

Each platform's subfolder has the same structure as the main one:

```txt
<platform>
├── <platform>.pri
├── cpp
├── js
├── qml
├── native
└── resources
    ├── fonts
    ├── images
    └── <other assets>
```

The _.pri_ file contains the build directives and lists the source files for the
specific platform.

The subfolder names are selfexplainatory and they contains platform-specific
files:

* _cpp_: contains the .hpp/.cpp source files;
* _js_: contains javascript files;
* _qml_: it contains QML source files;
* _native_: contains the source code in the platform's language (i.e. Java for
         Android); it is not included in all platform forlders as for most of
         them only C++ code is supported;
* _resources_: in contains resources, such as fonts, images, and other assets;
         they are also divided in subfolders.

## Build

This repo contains a _.pro_ file that can be opened in _Qt Creator_ and use that to easily build the project.

A _Makefile_ is also provided to be able to easily build the project in a CI pipeline.

In case _qmake_ is not in _PATH_, it's possible to specify the location:

```sh
QMAKE="/opt/Qt/5.12.0/clang_64/bin/qmake" make build
```
