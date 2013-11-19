import QtQuick 2.0

ListModel {
    id: menuItemModel
	
	property string menuItems: ""
	
    Component.onCompleted: {
        var items = JSON.parse(menuItems)
        var _width = 0
        var _height = 0
        for (var i in items) {
            menuItemModel.append({"itemId": items[i].itemId,
                                  "itemIcon":items[i].itemIcon,
                                  "itemText":items[i].itemText,
                                  "itemSubMenu":JSON.stringify(items[i].itemSubMenu)})
		}
    }
}