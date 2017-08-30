import QtQuick 2.0

Item {
    Component.onCompleted : console.log("Item RectTemp Completed")

    Rectangle{
        Component.onCompleted : console.log("RectTemp->Rect A Completed")
        Rectangle{
            Component.onCompleted : console.log("RectTemp->Rect1 AA Completed")
        }
    }

    Rectangle{
        Component.onCompleted : console.log("RectTemp->Rect B Completed")
    }
}
