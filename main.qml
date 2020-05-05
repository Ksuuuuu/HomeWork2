import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Window {
    visible: true
    width: 322
    height: 480
    color: "#fdf5f5"
    title: qsTr("Вконтакте")

    ListModel {
        id: contactsModel
        ListElement {
            name: "Никита"
            ava: "icons/icon1.png"
        }
        ListElement {
            name: "Настя"
            ava: "icons/icon2.png"
        }
        ListElement {
            name: "Алла"
            ava: "icons/icon3.png"
        }
    }

    ColumnLayout {
        y: 100
        spacing: 7
        anchors.fill: parent
        MainToolBar {
            x: 100
            y: 80
            width: 200
            height: 30
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.append({name: text, ava: "icons/person.png"});
            }
        }
        ContactList {
            id: list
            x: 0
            y: 120
            snapMode: ListView.SnapToItem
            Layout.fillHeight: true
            Layout.fillWidth: true
            model:contactsModel
            onMenu: {
                contactListMenu.popup();
            }

        }
    }
    Menu {
        id: contactListMenu
        modal: true
        MenuItem {
            text: "Удалить"
            onTriggered: {
              contactsModel.remove(list.menuIndex);
           }

        }
    }

    Image {
        id: image
        x: 0
        y: 0
        width: 54
        height: 39
        fillMode: Image.PreserveAspectFit
        source: "icons/s1200.png"
    }
}



