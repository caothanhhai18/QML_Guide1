import QtQuick

import utils
import popups
import mainui

Window {
    id: root
    visible: true
    color: Style.bgColor
    title: qsTr("QML Dashboard")
    width: Style.screenWidth
    height: Style.screenHeight

    Item {
        anchors.fill: parent
        HomePage {
            id: dashboardAppContent
            anchors.fill: parent
        }
        //Popups
        Popups {
            id: popups
        }
    }
}
