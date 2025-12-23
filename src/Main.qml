// Includes relevant modules used by the QML
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

// Provides basic features needed for all kirigami applications
Kirigami.ApplicationWindow {
    // Unique identifier to reference this object
    id: root

    width: 400
    height: 300

    // Window title
    // i18nc() makes a string translatable
    // and provides additional context for the translators
    title: i18nc("@title:window", "Hello World")

    // Set the first page that will be loaded when the app opens
    // This can also be set to an id of a Kirigami.Page
    pageStack.initialPage: Kirigami.Page {
        ColumnLayout {
            anchors.fill: parent

            Kirigami.Heading {
                font.weight: Font.DemiBold
                font.pointSize: 18
                font.underline: true
                level: 1
                text: "Welcome to Enigma"
                Layout.alignment: Qt.AlignHCenter
            }

            Controls.Label {
                Layout.minimumWidth: 100
                Layout.preferredWidth: 400
                font.pointSize: 10
                Layout.maximumWidth: 400
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                text: "Enigma is a program created to make cryptography accessible for all!"
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Controls.Button {
                    text: "Encrypt"
                }

                Controls.Button {
                    text: "Hash"
                }

                Controls.Button {
                    text: "Sign"
                }
            }
        }
    }
}
