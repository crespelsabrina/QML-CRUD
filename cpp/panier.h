#ifndef MYBIND_H
#define MYBIND_H

#include <QObject>
#include <QStringList>


class Panier : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString myString READ myString WRITE setmyString NOTIFY myStringChanged)
    Q_PROPERTY(QStringList myList READ myList WRITE setMyList NOTIFY myListChanged)

public:
    explicit Panier(QObject *parent = nullptr);
    Panier(const QStringList &myList, QObject *parent=0);

    QStringList myList() const
    {
        return m_myList;
    }

    QString myString() const
    {
        return m_myString;
    }

signals:
    void myListChanged(QStringList myList);

    void myStringChanged(QString myString);

public slots:

    void setMyList(QStringList myList)
    {
        if (m_myList == myList)
            return;

        m_myList = myList;
        emit myListChanged(m_myList);
    }

    void setmyString(QString myString)
    {
        if (m_myString == myString)
            return;

        m_myString = myString;
        emit myStringChanged(m_myString);
    }

private:
    QStringList m_myList;
    QString m_myString;
};

#endif // MYBIND_H
