#ifndef PERSONNE_H
#define PERSONNE_H

#include <QObject>
#include <QDebug>

 #include "panier.h"

class Personne : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString nom READ nom WRITE setNom NOTIFY nomChanged)
    Q_PROPERTY(QString prenom READ prenom WRITE setPrenom NOTIFY prenomChanged)
    Q_PROPERTY(int age READ age WRITE setAge NOTIFY ageChanged)
    Q_PROPERTY(Panier* panier READ panier WRITE panier NOTIFY panierChanged)

public:
    Personne(QObject *parent = nullptr);
    Personne* createCopy();

    QString nom() const
    {
        return m_nom;
    }

    QString prenom() const
    {
        return m_prenom;
    }

    int age() const
    {
        return m_age;
    }

    Panier* panier() const
    {
        return m_panier;
    }

signals:
    void nomChanged(QString nom);
    void prenomChanged(QString prenom);
    void ageChanged(int age);

    void panierChanged(Panier* panier);

public slots:
    void setNom(QString nom)
    {
        if (m_nom == nom)
            return;

        m_nom = nom;
        emit nomChanged(m_nom);
    }
    void setPrenom(QString prenom)
    {
        if (m_prenom == prenom)
            return;

        m_prenom = prenom;
        emit prenomChanged(m_prenom);
    }

    void setAge(int age)
    {
        if (m_age == age)
            return;

        m_age = age;
        emit ageChanged(m_age);
    }
    void panier(Panier* panier)
    {
        if (m_panier == panier)
            return;

        m_panier = panier;
        emit panierChanged(m_panier);
    }

private :
    QString m_nom;
    QString m_prenom;
    int m_age;
    Panier* m_panier;
};

#endif // PERSONNE_H
