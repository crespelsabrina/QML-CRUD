#ifndef MYAPP_H
#define MYAPP_H

#include <QObject>
#include <QQmlContext>
#include "personne.h"
#include <QDebug>

class Contexte : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Personne* personne READ personne WRITE setPersonne NOTIFY personneChanged)
    Q_PROPERTY(QString chaine1 READ getChaine1 WRITE setChaine1 NOTIFY chaine1Changed)

public:
    explicit Contexte(QObject *parent = nullptr);

    void setContext(QQmlContext *contexte);
    void updateContext();
    void updateTable1();

    Personne* personne() const
    {
        return m_personne;
    }

    QString getChaine1() const
    {
        return m_chaine1;
    }

signals:
    void chaine1Changed(QString chaine1);

public slots:
    void setChaine1(QString chaine1)
    {
        if (m_chaine1 == chaine1)
            return;

        m_chaine1 = chaine1;
        emit chaine1Changed(m_chaine1);
    }

private :
    QString m_chaine1;

public slots:
    Q_INVOKABLE void doActionInCpp(QString nomAction, int i = -1);

    void setPersonne(Personne* personne)
    {
        if (m_personne == personne)
            return;

        m_personne = personne;
        emit personneChanged(m_personne);
    }

signals:

    void personneChanged(Personne* personne);
private :
    QQmlContext* m_context;
    Personne* m_personne;

    QList<QObject*> m_listePersonnes;
};

#endif // MYAPP_H
