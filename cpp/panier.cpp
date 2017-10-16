#include "panier.h"

Panier::Panier(QObject *parent) : QObject(parent)
{
    m_myString = "maChaineEstInitialisée";
}

Panier::Panier(const QStringList &myList, QObject *parent)
    :m_myList(myList), QObject(parent)
{
}
