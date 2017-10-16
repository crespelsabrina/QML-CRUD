#ifndef MYQOBJECT_H
#define MYQOBJECT_H

#include <QObject>

class MyQObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString myString READ myString WRITE setmyString NOTIFY myStringChanged)

    QString m_myString;

public:
    explicit MyQObject(QObject *parent = nullptr);

    QString myString() const
    {
        return m_myString;
    }

signals:

    void myStringChanged(QString myString);

public slots:
    void setmyString(QString myString)
    {
        if (m_myString == myString)
            return;

        m_myString = myString;
        emit myStringChanged(m_myString);
    }
};

#endif // MYQOBJECT_H
