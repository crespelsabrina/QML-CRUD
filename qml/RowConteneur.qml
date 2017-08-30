import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
    id : root
    Rectangle{

        Row {
            spacing: 2
            width : 400
            height : 40

            MonConteneur{
                width : 160
                height : parent.height
                contenu :
                    Text {
                    text : "Mon libellé"
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                }
            }
            MonConteneur{
                width : 160
                height : parent.height
                contenu :
                    TextField {
                    width : parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                }
            }

            MonConteneur{
                height : parent.height
                contenu :
                    CheckBox {
                    text : ""
                    anchors.verticalCenter: parent.verticalCenter // ou à coder en JS
                    anchors.horizontalCenter: parent.horizontalCenter // ou à coder en JS
                }
            }
        }
    }
}
