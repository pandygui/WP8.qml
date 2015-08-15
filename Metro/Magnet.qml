import QtQuick 2.4

Flipable {
    id: flipable
    property int  magnetWidth: 64;

    width: magnetWidth;
    height: magnetWidth;

    property string text;
    property bool flipped: false

    front: Rectangle {
        id:r;
        anchors.fill: parent;

        color:Qt.rgba(Math.random(),Math.random(),Math.random(), 0.8);
        Text{
            text:flipable.text;
            anchors.centerIn: parent;
        }
    }
    back: r;

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 1; axis.y:0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
        angle: 0    // the d1fault angle
    }

    states: State {
        name: "back";
        when: flipable.flipped;
        PropertyChanges { target: rotation; angle: 180 }
    }

    transitions: Transition { NumberAnimation { target: rotation; property: "angle"; duration: 500 } }

    MouseArea { anchors.fill: parent; onClicked: flipable.destroy(100); }

    Timer{
        interval:Math.random()*2000+2000;  repeat:true; running:true;
        onTriggered:flipable.flipped = !flipable.flipped
    }
}
