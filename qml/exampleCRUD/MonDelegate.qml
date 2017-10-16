import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
    id : root

    property string champNom
    property string champPrenom
    property int    champAge

    height : 40
    width : 400

    Rectangle{
        Row {
            spacing: 2
            width : 400
            height : 40
            Rect_A{
                text : root.champNom
            }
            Rect_A{
                text : root.champPrenom
            }
            Rect_A{
                width : 60
                text : root.champAge
            }
        }
    }
}
