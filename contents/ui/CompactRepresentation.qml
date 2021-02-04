import QtQuick                      2.0
import QtQuick.Layouts              1.1
import org.kde.plasma.components    2.0     as PlasmaComponents
import org.kde.plasma.core          2.0     as PlasmaCore
import org.kde.plasma.plasmoid      2.0


Item
{
    id: root

    anchors.fill: parent
    Layout.preferredWidth:     55
    Layout.maximumWidth:       55

    // Layout.preferredHeight:     0
    // Layout.maximumHeight:       0

    PlasmaComponents.Label
             {
                 id: logo_label      
                 text: "WeChat " 
                 anchors.fill: parent
            }

    MouseArea
    {
        id:             mouse_area
        anchors.fill:   parent
        hoverEnabled:   true                // enable enter and exit events

        onClicked:
        {
            if (mouse.modifiers == Qt.NoModifier)         // just click
                widget_clicked()
            // else if (mouse.modifiers & Qt.ControlModifier)
            // {
            //     if (mouse.modifiers & Qt.ShiftModifier)   // control+shift+click
            //         widget_control_shift_clicked()
            //     else                                      // control+click
            //         widget_control_clicked()
            // }
        }

        // onEntered: mouse_entered()          // mouse has entered the area
        // onExited:  mouse_exited()           // mouse has left the area
    }

    property string onScript: "bash $HOME/.deepinwine/deepin-wine-helper/sendkeys.sh w wechat 4"

    function widget_clicked()
    {
        executable.exec(onScript)
    }

    PlasmaCore.DataSource {
	id: executable
	engine: "executable"
	connectedSources: []
	onNewData: disconnectSource(sourceName) // cmd finished

	function exec(cmd) {
	    connectSource(cmd)
	}
    }

}

