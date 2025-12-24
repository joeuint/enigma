#pragma once

#include <QObject>
#include <QString>

class GlobalBackend : public QObject {
Q_OBJECT

Q_PROPERTY(QString hashResult READ getHash NOTIFY hashChanged)

private:
    QString m_content;
    QString m_hash;

    QString getHash() const {
        return m_hash;
    }

    QString content() const {
        return m_content;
    };

public:
    GlobalBackend();

Q_SIGNALS:
    void hashChanged();

// public slots: does not work
// Maybe no_keywords is deffed?
// See: https://forum.qt.io/topic/155585/signals-and-public-slots-does-not-content-a-type/2
public Q_SLOTS:
    void setContent(const QString& content) {
        if (m_content != content) {
            m_content = content;
        }
    }

    void hash();
};
