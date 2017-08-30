import QtQuick 2.7
import QtQuick.Controls 2.2

Rectangle {        
    id : root
    color : "lightblue"
    border{width : 1; color : "lightgrey"}
    width : parent.width
    height : 40

    Rectangle {
        anchors.margins : 4
        anchors.fill :  parent
        color : "lightblue"

        TextField{
            visible : root.isSaisie
            width : parent.width
            height : parent.height
            anchors.verticalCenter: parent.verticalCenter
            color : "lightgray"
        }

        Text{
            id : idLibelle
            visible : !root.isSaisie
            width : parent.width
            height : parent.height
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
