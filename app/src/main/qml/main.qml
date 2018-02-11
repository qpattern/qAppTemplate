import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    width   : 640
    height  : 480

    visible : true

    title   : qsTr("Hello World")

    Text {
        anchors.fill        : parent

        horizontalAlignment : Text.AlignHCenter
        verticalAlignment   : Text.AlignVCenter

        text                : qsTr("This is just a template")
    }
}
