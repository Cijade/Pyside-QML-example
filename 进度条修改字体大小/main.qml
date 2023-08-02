import QtQuick
import QtQuick.Window
import FluentUI
import io.qt.elementproperties

FluWindow {
    id:mainwindow
    visible: true
    width: 1080
    height: 720
    title: "主页"


    Row {
        FluSlider {
            id: fontsizeslider
            value: 0.5
            onValueChanged: {
                fontsize.text = "字体大小:"+bridge.getSize(value)
                fontsize.font.pointSize = bridge.getSize(value)
            }
        }
        FluText {
            id:fontsize
            font.pointSize:45
            text:"字体大小:45"
        }

    }


}