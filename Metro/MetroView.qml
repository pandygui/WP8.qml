import QtQuick 2.0

Flickable {
    id:flickable;
    height: 400;
    enabled:true;
    flickableDirection :Flickable.VerticalFlick

    Metro{
        id:metro;
        onNewOne:{ flickable.contentHeight = metro.height; }
    }

//    Rectangle {
//        id: verticalScrollbar
//        //竖直
//        anchors.right: parent.right
//        anchors.rightMargin: 2
//        y:  flickable.visibleArea.yPosition * flickable.height;
//        width: 5
//        height : (flickable.visibleArea.heightRatio >= 1)?100:(flickable.visibleArea.heightRatio)*50;
//        radius: 2
//        color: "#b19393"
//    }

}
