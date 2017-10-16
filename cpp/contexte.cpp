#include "contexte.h"
#include <QDebug>
#include "panier.h"

Contexte::Contexte(QObject *parent) : QObject(parent), m_context(nullptr)
{
    m_personne = new Personne(this);
}

void Contexte::setContext(QQmlContext *context)
{
    m_context = context;
    m_context->setContextProperty("Context", this);
}

// Fonction to update the QML
void Contexte::updateContext()
{
    // Send the data to Qml
    if( m_context!= nullptr )
        m_context->setContextProperty("modelePersonnes", QVariant::fromValue( m_listePersonnes ));
    else
        qDebug() << "Context non instancié";

    updateTable1();
}

void Contexte::updateTable1()
{
    // Create QStringList
    QStringList test1;
    test1 << "Item 1" << "AAAAA" ;
    QStringList test2;
    test2 << "Item 2" << "BBBBB"  ;
    QStringList test3;
    test3 << "Item 3" << " " ;

    // Push_back QStringList into new one
    QList<QObject*> dataList;
    dataList.append(new Panier( test1 ));
    dataList.append(new Panier( test2 ));
    dataList.append(new Panier( test3 ));

    // Send the data to Qml
    if( m_context!= nullptr )
        m_context->setContextProperty("myModel", QVariant::fromValue( dataList ));
    else
        qDebug() << "Context non instancié";
}

void Contexte::doActionInCpp(QString nomAction, int i)
{
//    qDebug() << "nomAction : " << nomAction ;
//    if( i!=-1 )
//        qDebug() << "i =  " << i ;

    if( nomAction== "ajouterPersonne" )
    {
        Personne* newP = m_personne->createCopy();
        m_listePersonnes.push_back( newP );
    }
    else if( nomAction== "modifierPersonne" )
    {
        QObject* op = m_listePersonnes.at( i );
        Personne* p = qobject_cast<Personne *> (op);
        if( p )
        { //traitement
            p->setNom( m_personne->nom() ) ;
            p->setPrenom( m_personne->prenom() ) ;
            p->setAge( m_personne->age() ) ;
        }
    }
    else if( nomAction== "supprimerPersonne" )
    {
        m_listePersonnes.removeAt( i );
    }
    updateContext();
}
