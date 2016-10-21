import QtQuick 2.4
import Qtapp2 1.0
import Ubuntu.Components 1.3

MainView {
    // Note! applicationName needs to match the .desktop filename
    applicationName: "com.ubuntu.whereisloic"

    width: units.gu(150)
    height: units.gu(120)

    Column {
        anchors {
            fill: parent
            margins: units.gu(1)
        }
        spacing: units.gu(1)

        Label {
            maximumLineCount: 3
            text: "Test 1 2 3."
            width: parent.width
            wrapMode: Text.Wrap
            font.pointSize: 28
        }

        UbuntuShape {
            width: units.gu(50)
            height: units.gu(50)
            aspect: UbuntuShape.DropShadow
            radius: "large"
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: loic
                anchors.centerIn: parent
                source: "loic.jpeg"

                states: State {
                    name: "rotated"
                    PropertyChanges { target: loic; rotation: 360000 }
                }

                transitions: Transition {
                    RotationAnimation {
                        duration: 6000000;
                        direction: RotationAnimation.Clockwise
                    }
                }
            }

        }
        Label {
            maximumLineCount: 10
            text: "This test app is running, confined, on top of shared Qt and Ubuntu UI Toolkit libraries .snap, using 300MB+ of shared data to save space.\n(and the same saving for each (sn)app)\n\nSnap store does not yet support the shared snap (reportedly fixed in master)"
            width: parent.width
            wrapMode: Text.Wrap
            font.family: "Ubuntu"
            font.pointSize: 28
        }
    }

    Component.onCompleted: loic.state = "rotated"
}
