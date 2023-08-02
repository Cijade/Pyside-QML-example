# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import *

QML_IMPORT_NAME = "io.qt.elementproperties"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Bridge(QObject):

    # 定义一个槽函数
    @Slot(float, result=int)
    def getSize(self, s):
        size = int(s)
        if size <= 0:
            return 1
        else:
            return size

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    bridge = Bridge()
    engine.rootContext().setContextProperty("bridge", bridge)  #注册到QML

    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
