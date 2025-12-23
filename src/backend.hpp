#pragma once

#include <QObject>

class GlobalBackend : public QObject {
Q_OBJECT

public:
    GlobalBackend();


// public slots: does not work
// Maybe no_keywords is deffed?
// See: https://forum.qt.io/topic/155585/signals-and-public-slots-does-not-name-a-type/2
public Q_SLOTS:
    void sayHello();
};
