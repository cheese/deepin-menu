import QtQuick 2.0

import "MenuItem.js" as MenuItemJs

Component {
    Rectangle {
        id: itemArea
        width: ListView.view.width
        height: componentText.text == "" ? verticalPadding * 2 + 2 : Math.max(componentImage.implicitHeight
                                                                              + verticalPadding * 2,
                                                                              componentText.implicitHeight
                                                                              + verticalPadding * 2)
        color: Qt.rgba(0, 0, 0, 0)

        property bool isSep: itemText == ""
        property var fullscreenBg: ListView.view.fullscreenBg
        property int verticalPadding: ListView.view.verticalPadding
        property int horizontalPadding: ListView.view.horizontalPadding
        property int textLeftMargin: ListView.view.textLeftMargin
        property int textRightMargin: ListView.view.textRightMargin
        property int textSize: ListView.view.textSize
        property color textColor: ListView.view.textColor
		property bool isDockMenu: ListView.view.isDockMenu

        property string componentSubMenu: itemSubMenu
        property string componentId: itemId

        property alias itemTextColor: componentText.color
		property alias itemArrowPic: componentIndicator.source

        Image {
            id: componentImage
            visible: itemIcon != ""
            source: itemIcon
            anchors.left: parent.left
            anchors.leftMargin: horizontalPadding
            anchors.rightMargin: horizontalPadding
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: componentText
            visible: itemText != ""
            text: itemText
            color: textColor
            font.pixelSize: 12
			
            anchors.left: parent.left
			anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: parent.textLeftMargin
			anchors.rightMargin: parent.textRightMargin
        }

        Image {
            id: componentIndicator
            visible: componentSubMenu != "[]" && componentSubMenu != undefined && !isSep
			source: parent.isDockMenu ? parent.ListView.view.arrowDark : parent.ListView.view.arrowLight

			anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.horizontalPadding
        }

        Row {
            visible: parent.isSep
            anchors.centerIn: parent
            Rectangle {
                id: itemSeparator1
                width: 1
                height: itemArea.ListView.view.width - 4
                transformOrigin: Item.Center
                rotation: 90
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.rgba(1, 1, 1, 0.1)}
                    GradientStop { position: 0.5; color: Qt.rgba(1, 1, 1, 0.15) }
                    GradientStop { position: 1.0; color: Qt.rgba(1, 1, 1, 0.1) }
                }
            }

            Rectangle {
                id: itemSeparator
                width: 1
                height: itemArea.ListView.view.width - 4
                transformOrigin: Item.Center
                rotation: 90
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.rgba(0, 0, 0, 0.1) }
                    GradientStop { position: 0.5; color: Qt.rgba(0, 0, 0, 0.15) }
                    GradientStop { position: 1.0; color: Qt.rgba(0, 0, 0, 0.1) }
                }
            }
        }

        MouseArea {
            id: mouseArea
            visible: !parent.isSep
            anchors.fill: parent
            hoverEnabled: true

            onPressed: MenuItemJs.onPressed(parent, menu)
            onEntered: MenuItemJs.onEntered(index, menu)
        }
    }
}