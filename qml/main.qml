import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 740
    title: qsTr("Full-Stack project : mvcQml_v04")

    // "menuBar:" need the qml to start with "ApplicationWindow"
    menuBar: MyMenuBar{}



    Item {
        id: rootView
        anchors.fill: parent

        //[1]
        MyTableView {
            x: 150
            y: 50
        }

        //[2]
        Button {
            text: "View TableView"
            onClicked: {
                idTableView.visible = true
            }
        }

        MyTableView {
            x: 150
            y: 210
            id: idTableView
            visible: false
        }

        //[3]
        Button {
            x: 100
            text: "View TableView in Window"
            onClicked: {
                idWindow2.visible = true
            }
        }
        Window {
            id:idWindow2
            visible: false
            MyTableView{}
        }

        //[4]
        MyListView {
            x: 150 ; y: 370

        }

        //[5]
        MyListView2D {
            x: 150 ; y: 470
        }

    }
}
