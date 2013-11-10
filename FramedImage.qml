import QtQuick 2.1

Rectangle {
    property url source
    property bool visibleFrame: true
    height: image.sourceSize.height
    width: image.sourceSize.width
    color: visibleFrame ? "#80c342" : "transparent"
    Image {
        id: image
        source: parent.source
        anchors.fill: parent
        anchors.margins: 8
        smooth: true;
    }
}
