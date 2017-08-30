import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFiels

Item {
    id : root

    height : 60
    width : 400 // à supprimer

    Rectangle{
        Component.onCompleted : console.log("REctangle EditLine Completed")
        Row {
            spacing: 2
            width : 400
            height : 40
            MonConteneur{
                width : 160
                height : parent.height
                contenu :
                    Text{
                    text : root.champNom
                    width : parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                    Component.onCompleted : console.log("TextField Completed")
                }
            }
            MonConteneur{
                width : 160
                contenu :
                    Text{
                    text : root.champPrenom
                    width : parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                }
            }

            MonConteneur{
                width : 60
                contenu :
                    Text{
                    text : root.champAge
                    width : parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                }
            }
        }
    }
}
