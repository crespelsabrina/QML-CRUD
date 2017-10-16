#include "personne.h"

Personne::Personne(QObject *parent)
{
    m_panier = new Panier; // mettre en commentaire pour voir le type d'erreurs
}

Personne* Personne::createCopy() // Pour pallier l'absence de constructeur de recopie
{
    Personne* newP = new Personne();
    newP->setNom( nom() );
    newP->setPrenom( prenom() );
    newP->setAge( age() );
    return newP;
}
