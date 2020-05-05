import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13

Rectangle {
    id: me
    property alias icon: ava.source
    property alias text: label.text
    property bool selected: false

    signal leftClick()
    signal rightClick()

    width:parent.width
    height: 60
    color: {
        if(selected)
            return "#5b9cf1"
        if(area.containsMouse)
            return "#f1f1f1f1"
        return "white"
    }

    RowLayout {
        anchors.fill:parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 7
        Image {
            id: ava
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7

        }
        ColumnLayout {
        Label {
            id: label
            font.pixelSize: 15
            Layout.margins: 5
            Layout.fillWidth: true
        }
    }
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
           if(mouse.button === Qt.LeftButton)
               leftClick();
           if(mouse.button === Qt.RightButton)
               rightClick();




        }
    }

}
