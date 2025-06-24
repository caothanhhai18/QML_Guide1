import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

import utils


Item {
    id: root

    property alias menuItemText: menuTextLabel.text
    property bool reorderDashBoardItems: false
    property bool reorderSwitchVisible: true

    DropShadow {
        anchors.fill: backgroundColor
        verticalOffset: Style.resize(3)
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: backgroundColor
    }

    Rectangle {
        id: backgroundColor
        width: parent.width
        height: parent.height
        anchors.right: parent.right
        color: "#fff"
    }

    Label {
        id: menuTextLabel
        anchors.left: parent.left
        anchors.leftMargin: Style.resize(90)
        anchors.verticalCenter: parent.verticalCenter
        color: "#fff"
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: Style.resize(20)
        anchors.verticalCenter: parent.verticalCenter
        spacing: Style.resize(20)
        Switch {
            width: Style.resize(130)
            height: Style.resize(26)
            text: qsTr("Reorder")
            checked: root.reorderDashBoardItems
            onClicked: {
                root.reorderDashBoardItems = !root.reorderDashBoardItems;
            }

            opacity: root.reorderSwitchVisible ? 1.0 : 0.0
            visible: (opacity > 0.0)
            Behavior on opacity { NumberAnimation { duration: 200 } }
        }

        ToolButton {
            id: settings
            width: Style.resize(26)
            height: Style.resize(26)
            icon.source: Style.icon("settings")
            onClicked: {
                dropDownMenuLoader.active = !dropDownMenuLoader.active;
            }
        }

        ToolButton {
            id: onOff
            width: Style.resize(26)
            height: Style.resize(26)
            icon.source: Style.icon("onoff")
            onClicked: {
                Qt.quit();
            }
        }

    }

    Loader {
        id: dropDownMenuLoader
        width: Style.resize(228)
        height: Style.resize(127)
        anchors.top: parent.top
        anchors.topMargin: ((height / 2) + Style.resize(10))
        anchors.right: parent.right
        anchors.rightMargin: Style.resize(45)
        active: false
        opacity: active ? 1.0 : 0.0
        visible: (opacity > 0.0)
        Behavior on opacity { NumberAnimation { duration: 200 } }
        sourceComponent:
            Frame {
                anchors.fill: parent
                background: Image {
                source: Style.gfx("dropdown")
                width: Style.resize(sourceSize.width)
                height: Style.resize(sourceSize.height)
            }
            contentItem:
                Column {
                    anchors.top: parent.top
                    anchors.topMargin: Style.resize(20)
                    anchors.left: parent.left
                    anchors.leftMargin: Style.resize(30)
                    spacing: Style.resize(8)

                    Label {
                        text: qsTr("Select Theme")
                    }

                    Repeater {
                        model: ["Green", "Orange"]
                        delegate: RadioButton {
                            width: Style.resize(100)
                            height: Style.resize(26)
                            text: qsTr("%1").arg(modelData)
                            onClicked: {
                                if (modelData === "Green") {
                                    Style.setGreenTheme();
                                } else {
                                    Style.setOrangeTheme();
                                }
                                dropDownMenuLoader.active = false;
                            }
                            checked: (Style.theme === modelData.toLowerCase())
                        }
                    }
                }
        }
    }
}
