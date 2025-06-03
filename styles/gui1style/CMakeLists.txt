qt_add_library(gui1style STATIC)
qt_add_qml_module(gui1style
    URI "gui1style"
    VERSION 1.0
    QML_FILES
        BusyIndicator.qml
        Button.qml
        Dial.qml
        Label.qml
        Popup.qml
        RadioButton.qml
        Slider.qml
        Switch.qml
        ToolButton.qml
)
