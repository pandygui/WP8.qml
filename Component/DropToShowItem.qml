import QtQuick 2.0

Rectangle {
    id: dropToShowItem
    property int contentHeight;
    color: "red";
    opacity: (dropToShowItem.y > 0)?1:0;
    signal drop;
    property bool isDownState: true;

    property int frontY: 0;
    property alias nowY: dropToShowItem.y;

    transitions: Transition { NumberAnimation { duration:900; property: "y"; easing.type: Easing.InOutQuint } }

    states: [
        State { name: "down"; PropertyChanges { target: dropToShowItem; y:dropToShowItem.contentHeight; } },
        State { name: "up"; PropertyChanges { target: dropToShowItem;y : 0; } }
    ]

    MouseArea {
        anchors.fill: parent;
        drag.target: dropToShowItem;
        drag.axis: Drag.YAxis;
        drag.minimumY: 0;
        drag.maximumY:dropToShowItem.contentHeight;
        onReleased : dropToShowItem.autoDrop();
    }

    onYChanged: {
        if(frontY - nowY > 0){
            isDownState = false;
            frontY = nowY;
        } else {
            isDownState = true;
            frontY = nowY;
        }
        dropDownListItem.height = dropToShowItem.y;
    }

    Rectangle {
        id:dropDownListItem;
        width:dropToShowItem.width;
        height: 0;
        color:"#FF7F00";
        opacity: 0.9;
        anchors.bottom: dropToShowItem.top;
        z:dropToShowItem.z-1;
        ListView{
            anchors{
                fill:parent;
                topMargin: dropToShowItem.height;
                rightMargin: 5;
                leftMargin: 5;
            }
            model:100;
            delegate:Text{ text:"系统通知";font.pixelSize: 20; }
        }
    }

    function autoDrop(){
        if(isDownState) {
            dropToShowItem.state = "down";
        } else {
            dropToShowItem.state = "up";
        }
        dropToShowItem.drop();
    }
}



