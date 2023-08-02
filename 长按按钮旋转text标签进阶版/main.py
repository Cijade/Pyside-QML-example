# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import *


def sayThis(s):
    print(s)
    
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    
    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(qml_file)

    root = engine.rootObjects()[0]
    root.textRotationChanged.connect(sayThis)
    root.buttonClicked.connect(lambda: sayThis("clicked button (QML top-level signal)"))


    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
