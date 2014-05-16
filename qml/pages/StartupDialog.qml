/**********************************************************************
*
* This file is part of the JollaOpas, forked from Jopas originally
* forked from Meegopas.
* More information:
*
*   https://github.com/hsarkanen/JollaOpas
*   https://github.com/rasjani/Jopas
*   https://github.com/junousia/Meegopas
*
* Author: Heikki Sarkanen <heikki.sarkanen@gmail.com>
* Original author: Jukka Nousiainen <nousiaisenjukka@gmail.com>
* Other contributors:
*   Jani Mikkonen <jani.mikkonen@gmail.com>
*   Jonni Rainisto <jonni.rainisto@gmail.com>
*   Mohammed Sameer <msameer@foolab.org>
*   Clovis Scotti <scotti@ieee.org>
*   Benoit HERVIER <khertan@khertan.net>
*
* All assets contained within this project are copyrighted by their
* respectful authors.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* See full license at http://www.gnu.org/licenses/gpl-3.0.html
*
**********************************************************************/

import QtQuick 2.1
import Sailfish.Silica 1.0
import "../js/storage.js" as Storage
import "../components"

Dialog {
    Column {
        anchors.fill: parent

        DialogHeader {
            acceptText: defaultAcceptText
        }

        ComboBox {
            id: region
            label: qsTr("Choose region")
            menu: ContextMenu {
                MenuItem { text: "Helsinki" }
                MenuItem { text: "Tampere" }
            }
        }

        Label {
            x: Theme.paddingLarge
            width: parent.width - Theme.paddingLarge * 2
            text: qsTr("Allow this application to use the phone location services to enhance the routing experience?") + "\n\n" + qsTr("The setting can be later changed from the application preferences.")
            wrapMode: Text.WordWrap
        }

        TextSwitch {
            id: gpsSwitch
            width: parent.width
            text: qsTr("Use location services")
        }

    }

    onAccepted: {
        Storage.setSetting('api', region.currentIndex == 0 ? "helsinki" : "tampere")
        Storage.setSetting('gps', gpsSwitch.checked ? 'true' : 'false')
    }
}
