import QtQuick 2.0
import "../Component"

Grid {
    id:root;
    columns: 4;
    spacing: 6;
    signal newOne;
    readonly property int magnetWidth : 64;
    Button{ onClicked: root.creat(); }

    function creat(){
        var component = Qt.createComponent("./Magnet.qml");
        if(component.status == Component.Ready) {
            for(var i=0;i<19; i++) {
                var item = component.createObject(root);
                item.text = root.children.length;
                item.z = root.z;
                item.magnetWidth = root.magnetWidth;
                root.newOne();
                root.rows = Math.ceil(root.children.length/root.columns) + 1;
            }
        }
    }

}
