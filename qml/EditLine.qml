import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
//    property alias champNom : idNom.text
    height : 60
    width : 400 // à commenter temporairement

    Rectangle{
        Row {
            spacing: 2
            width : 400
            height : 40

            RectField_A{
                id : idNom
            }
            RectField_A{
                id : idPrenom
            }
            RectField_A{
                id : idAge
            }
        }
    }
}
