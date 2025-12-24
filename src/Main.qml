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

    // i18nc() makes a string translatable
    // and provides additional context for the translators
    title: "Hello World"

    // Set the first page that will be loaded when the app opens
    // This can also be set to an id of a Kirigami.Page
    pageStack.columnView.columnResizeMode: Kirigami.ColumnView.SingleColumn
    pageStack.initialPage: Kirigami.Page {
        id: titlePage
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
                    onClicked: pageStack.push(hashPage)
                }

                Controls.Button {
                    text: "Sign"
                }
            }
        }
    }
    Component {
        id: hashPage
        Kirigami.ScrollablePage {
            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter

                Kirigami.FormLayout {
                    Kirigami.Heading {
                        font.weight: Font.DemiBold
                        font.pointSize: 18
                        font.underline: true
                        level: 1
                        Layout.alignment: Qt.AlignHCenter
                        text: "Hashing"
                    }

                    Controls.ComboBox {
                        id: algo
                        model: ["SHA-256", "SHA-512"]
                        Kirigami.FormData.label: "Algorithm"
                    }

                    Controls.TextField {
                        id: content
                        Kirigami.FormData.label: "Content"
                        onTextChanged: backend.setContent(text)
                    }

                    Controls.Button {
                        text: "Hash"
                        onClicked: backend.hash()
                    }

                }
                Controls.TextArea {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: root.width * 0.5
                    Layout.maximumWidth: 1000
                    wrapMode: Text.WrapAnywhere
                    readOnly: true
                    text: backend.hashResult
                }
            }
        }
    }
}
