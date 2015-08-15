import QtQuick 2.4
import "./Metro" as Metro;
import "./Component"

Rectangle {
    id:main;
    height: 640;
    width: 360;
    color:"black";

    Image{
        id:background;
        anchors.fill: parent;
        source: "./Image/R18.jpg";
        fillMode: Image.PreserveAspectFit
    }

    HeadBar{
        id:headBar;
        anchors.top:main.top;
        appView : main;
        height:main.height - metroView.height;
        z:main.z+1;
        width: main.width;
        color:"black";
    }

    Metro.MetroView{
        id:metroView;
        anchors{
            top:headBar.top;
            topMargin: headBar.height;
        }
        height: 620;
        width: 360;
    }

    Button{
        id:button;
        width: 45;
        height: 45;
        anchors{
            bottom: main.bottom;
            bottomMargin: 10;
            rightMargin: 10;
            right: main.right;
        }
        radius:button.width;
        text:"=>"
    }
}
