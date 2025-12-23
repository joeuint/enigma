#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <QQuickStyle>
#include <KLocalizedContext>
#include <KLocalizedString>
#include <KIconTheme>
#include <memory>

#include "backend.hpp"

int main(int argc, char *argv[])
{
    KIconTheme::initTheme();
    QApplication app(argc, argv);
    KLocalizedString::setApplicationDomain("josephumana.com");
    QApplication::setOrganizationName(QStringLiteral("Joseph Umana"));
    QApplication::setOrganizationDomain(QStringLiteral("josephumana.com"));
    QApplication::setApplicationName(QStringLiteral("Enigma"));
    QApplication::setDesktopFileName(QStringLiteral("com.josephumana.enigma"));

    QApplication::setStyle(QStringLiteral("breeze"));
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
        QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));
    }

    QQmlApplicationEngine engine;

    auto* backend = new GlobalBackend();

    engine.rootContext()->setContextProperty(QStringLiteral("backend"), backend);

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.loadFromModule("com.josephumana.enigma", "Main");

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}

