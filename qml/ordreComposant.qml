import QtQuick 2.0

Item {
    Component.onCompleted : console.log("ordreComponent Completed")
    Rectangle{
        Component.onCompleted : console.log("Rectangle 1 Completed")

    }

    Rectangle{
        Component.onCompleted : console.log("Rectangle 2 Completed")
        Rectangle{
            Component.onCompleted : console.log("Rectangle 3 Completed")
            Rectangle{
                Component.onCompleted : console.log("Rectangle 4 Completed")
            }
        }
    }

    RectTemp{

    }

    Rectangle{
        Component.onCompleted : console.log("Rectangle 5 Completed")
    }
}
