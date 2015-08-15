import QtQuick 2.0

Rectangle {
    property alias text: text.text;

    width: 62;
    height: 62;
    color:"blue"
    signal clicked;

    Text{
        id:text;
        anchors.centerIn: parent;
        text:"add"

    }

    MouseArea{
        anchors.fill: parent;
        onPressed: {
            parent.color = "#66ccff";
        }

        onReleased:{
            parent.color = "blue";
        }

        onClicked: {
            parent.clicked();
        }
    }
}

