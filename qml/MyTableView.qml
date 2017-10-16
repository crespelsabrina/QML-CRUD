import QtQuick 2.0
import QtQuick.Controls 1.4


TableView {
    TableViewColumn {
        role: "title"
        title: "Title"
    }
    TableViewColumn {
        role: "author"
        title: "Author"
    }

        itemDelegate : Rectangle {
            border.color : "cyan"
            border.width: 1
            color : styleData.row%2 ? "white" : "#efefef"
            Text{
                text :  modelData.myList[styleData.column]
            }
        }

//    rowDelegate: ListView {
//        orientation: ListView.Horizontal
//        model : modelData.myList
//        delegate : Text{
//            text :  modelData
//        }
//    }
}

