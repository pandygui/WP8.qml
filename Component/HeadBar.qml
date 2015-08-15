import QtQuick 2.0

Rectangle {
    width: 100;
    height: 62;
    id:headBar;
    property variant appView;
    color:"black";
    signal drop;

    Row{
        Text {
            id: time;
            color:"white";
            Timer {
                interval: 500; running: true; repeat: true;
                onTriggered:{ var t =new Date(); time.text = t.getHours()+":"+t.getMinutes()+":"+t.getSeconds(); }
            }
        }
    }

    DropToShowItem {
        id: dropToShowItem
        width: headBar.width;
        height: headBar.height;
        contentHeight:headBar.appView.height - headBar.height;

    }
    Connections{ target: dropToShowItem; onDrop:headBar.drop(); }
}

