import QtQuick
import QtQuick.Window
import FluentUI


FluWindow {
    id:mainwindow
    visible: true
    width: 1080
    height: 720
    title: "Demo"

    signal buttonClicked
    signal textRotationChanged(double rot)


    FluText {
        id: text1
        text:"Hello World!"
        y: 100
        x: mainwindow.width/2-width/2
        font.pointSize: 24; font.bold: true
        onRotationChanged: textRotationChanged(rotation)

        states: State {
            name: "down"; when: buttonMouseArea.pressed === true
            PropertyChanges {
                target: button;
                color:"gray"
                rotation: 180;//旋转角度
            }
            PropertyChanges {
                target: text1;
                rotation: 180;//旋转角度
                y: 200;
            }
        }

        transitions: Transition {
            from: ""; to: "down"; reversible: true//动画是否可逆
            ParallelAnimation {
                NumberAnimation {
                    properties: "y, rotation"
                    duration: 500 //动作速度
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    Rectangle {
        id: button
        width: 150; height: 40
        color: "white"
        anchors.horizontalCenter: mainwindow.horizontalCenter
        y: 400
        x: mainwindow.width/2-width/2
        MouseArea {
            id: buttonMouseArea
            objectName: "buttonMouseArea"
            anchors.fill: parent
            onClicked: {
                buttonClicked()
            }
        }
        Text {
            id: buttonText
            text: "Press me!"
            anchors.horizontalCenter: button.horizontalCenter
            anchors.verticalCenter: button.verticalCenter
            font.pointSize: 16
        }
    }
}