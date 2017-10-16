import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "exampleCRUD"

Window {
    visible: true // obligatoire!!
    width: 500
    height : 400
    Rectangle {
        anchors.fill : parent
        color : "lavender"
        id : root
        property int largeurBouton : 140

        Column{
            spacing : 2

            Rectangle{
                //footer transparent
                color : "transparent"
                width : 10
                height : 10
            }

            Row{
                Text{
                    width : 160 // RectField_A.width
                    text : "Nom"
                    horizontalAlignment: Text.AlignHCenter
                }
                Text{
                    width : 160
                    text : "Prénom"
                    horizontalAlignment: Text.AlignHCenter
                }
                Text{
                    width : 60
                    text : "Age"
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            EditLine
            {
                id : idEditLine

            }

            Row{
                spacing: 20
                id : idLigneSaisie
                function updateCurrentPersonne()
                {
                    Context.personne.prenom = idEditLine.champPrenom
                    Context.personne.nom = idEditLine.champNom
                    Context.personne.age = 1*idEditLine.champAge
                }

                function doCRUDActionOnListView(nomAction)
                {
                    idLigneSaisie.updateCurrentPersonne()

                    // highlight
                    var tmpDuration = idListView.highlightMoveDuration
                    idListView.highlightMoveDuration = 0

                    var tmpIndex = idListView.currentIndex

                    //====
                    Context.doActionInCpp( nomAction, idListView.currentIndex )
                    //====

                    if( nomAction == "ajouterPersonne" )
                    {
                        idListView.currentIndex = idListView.model.length - 1
                    }
                    else
                    {
                        if( tmpIndex == idListView.model.length)
                            idListView.currentIndex = tmpIndex - 1
                        else
                            idListView.currentIndex = tmpIndex
                    }
                    idListView.highlightMoveDuration = tmpDuration
                }

                Button{
                    text: "Ajouter"
                    onClicked: {
                        idLigneSaisie.doCRUDActionOnListView( "ajouterPersonne" )
                    }
                }
                Button{
                    text: "Modifier"
                    onClicked: {
                        if( idListView.model.length>0 && idListView.currentIndex!= -1)
                        {
                            idLigneSaisie.doCRUDActionOnListView( "modifierPersonne" )
                        }
                    }
                }
                Button{
                    text: "Supprimer"
                    onClicked: {
                        idLigneSaisie.doCRUDActionOnListView( "supprimerPersonne" )

                        //                        idEditLine.champNom = ""
                        //                        idEditLine.champPrenom = ""
                        //                        idEditLine.champAge = ""
                    }
                }
            }

            ListView{
                id : idListView
                y : 200
                width : 380 + 2*2
                height : 400
                model: modelePersonnes
                delegate : MonDelegate {
                    // TODO : align HCenter pour l'age
                    width : parent.width
                    property var lesDonnees : modelData
                    champNom : modelData.nom
                    champPrenom: modelData.prenom
                    champAge: modelData.age
                    MouseArea{
                        anchors.fill : parent
                        onClicked : {
                            idListView.currentIndex = index + "#"

                            idEditLine.champPrenom = champPrenom
                            idEditLine.champNom = champNom
                            idEditLine.champAge = champAge
                        }
                    }
                }
                highlight: Rectangle{
                    // TODO : mettre le binding pour la largeur (au lieu de le coder en sur)
                    width : 380 + 2*2
                    height : 40
                    color : "navy"
                    opacity: .1
                    z : 2
                }
                //                highlightMoveDuration: 0
                interactive: false
            }
        }
    }

    Button{
         y : 220
        onClicked: {
            Context.personne.nom = "AB"
        }
    }

    Window {
        id:idWindow2
        width : 400
        visible: false

        MyTableView{
            width : 340
            height : 100
            model: myModel
        }
    }
}
