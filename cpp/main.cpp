#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "contexte.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QQmlContext* ctx = engine.rootContext();
    Contexte myApp;

    // Set le ctx
    myApp.setContext( ctx );

    // Update le ctx
    myApp.updateContext();

    // Ouvrir le Qml
    engine.load(QUrl(QStringLiteral("qml/qml.qml")));

    if (engine.rootObjects().isEmpty())
    { return -1; }

    return app.exec();
}
