QT       += core gui widgets qml quick

TEMPLATE = app
CONFIG += c++11
CONFIG -= app_bundle
# CONFIG -= qt

SOURCES += cpp/main.cpp \
    cpp/wmanager.cpp

HEADERS += \
    cpp/wmanager.h

DISTFILES += \
    qml/qml.qml \
    qml/EditLine.qml \
    qml/Rect_A.qml \
    qml/RectField_A.qml \
    qml/MonDelegate.qml
