import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    width: 400
    height : 400
    color : "lavender"
    id : root
    property int largeurBouton : 140

    Column{
        spacing : 2

        EditLine
        {
        }

        Row{
            spacing: 20
            Button{
                text: "Ajouter"
                onClicked: {
                    Context.sendActionToCpp("ajouterLigne", "bach;mine;17")
                }
            }
            Button{
                text: "Modifier"
                onClicked: console.log("ajouter")
            }
            Button{
                text: "Supprimer"
                onClicked: console.log("ajouter")
            }
        }

        ListView{
            y : 200

            width : 400
            height : 400
            model: UnModelARenseigner
            delegate : MonDelegate {
                property string lesDonnees : modelData
                onLesDonneesChanged : {
                    console.log( "lesDonnees = "+ lesDonnees )
                }
            }
        }
    }
}
