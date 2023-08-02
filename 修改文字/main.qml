import QtQuick
import QtQuick.Window
import FluentUI
import io.qt.elementproperties

FluWindow {
    id:mainwindow
    visible: true
    width: 1080
    height: 720
    title: "Demo"


    Column {
        spacing: 5
        Row {
            spacing: 5
            FluButton {
                id:button1
                text:"修改按钮文字"
                onClicked: {
                    bridge.changetext() //使用python预定值
                }
            }
            FluButton {
                id:button2
                text:"修改文本文字"
                onClicked: {
                    bridge.settext(text2.text) //将QML参数值传递给python
                }
            }
            FluText {
                id:text1
                text:"Text"
            }
        }

        FluTextBox {
            id:text2
            text:""
        }
    }


    Connections {
        target: bridge
        function onBtn1Sig(newtext) //target是方法，function绑定信号，on+首字母大写 信号
        {
            button1.text = newtext
        }
        function onBtn2Sig(newtext) //target是方法，function绑定信号，on+首字母大写 信号
        {
            text1.text = newtext
        }
    }

}


