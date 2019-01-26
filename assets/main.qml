// -*- qml -*-
/* Version 1.1 */

import bb.cascades 1.0

Page {
    id: pg

    property variant appScene: Application.scene

    onAppSceneChanged: {
        txt.requestFocus()
        txt.text = _app.getText()
    }

	function swithInputFlags(v) {
	    if(v != 0) {
            txt.input.flags = TextInputFlag.AutoCapitalizationOff |
            		TextInputFlag.PredictionOff |
            		TextInputFlag.SpellCheckOff |
            		TextInputFlag.WordSubstitutionOff
	    } else {
            txt.input.flags = TextInputFlag.AutoCapitalization |
            		TextInputFlag.Prediction |
            		TextInputFlag.WordSubstitution
	    }
	}

    function lat2geo(c) {
        var r = c
        switch (c) {
            case "a":
                r = "ა"
                break
            case "b":
                r = "ბ"
                break
            case "g":
                r = "გ"
                break
            case "d":
                r = "დ"
                break
            case "e":
                r = "ე"
                break
            case "v":
                r = "ვ"
                break
            case "z":
                r = "ზ"
                break
            case "T":
                r = "თ"
                break
            case "i":
                r = "ი"
                break
            case "k":
                r = "კ"
                break
            case "l":
                r = "ლ"
                break
            case "m":
                r = "მ"
                break
            case "n":
                r = "ნ"
                break
            case "o":
                r = "ო"
                break
            case "p":
                r = "პ"
                break
            case "J":
                r = "ჟ"
                break
            case "r":
                r = "რ"
                break
            case "s":
                r = "ს"
                break
            case "t":
                r = "ტ"
                break
            case "u":
                r = "უ"
                break
            case "f":
                r = "ფ"
                break
            case "q":
                r = "ქ"
                break
            case "R":
                r = "ღ"
                break
            case "y":
                r = "ყ"
                break
            case "S":
                r = "შ"
                break
            case "C":
                r = "ჩ"
                break
            case "c":
                r = "ც"
                break
            case "Z":
                r = "ძ"
                break
            case "w":
                r = "წ"
                break
            case "W":
                r = "ჭ"
                break
            case "x":
                r = "ხ"
                break
            case "j":
                r = "ჯ"
                break
            case "h":
                r = "ჰ"
                break
        }
        return r
    }

    Container {
        layout: StackLayout {}
        id: ed
        TextArea {
            id: txt
            layoutProperties: StackLayoutProperties {
                spaceQuota: 9.0

            }
            maximumLength: -1

            textFormat: TextFormat.Plain
            focusPolicy: FocusPolicy.KeyAndTouch
            inputMode: TextAreaInputMode.Chat
            input {
                flags: TextInputFlag.AutoCapitalizationOff
                    | TextInputFlag.PredictionOff
                    | TextInputFlag.SpellCheckOff
                    | TextInputFlag.WordSubstitutionOff
            }
            onTextChanging: {
                if (dd.selectedOption.value == 0) {
                    var t = qsTr(text.substr(0, text.length - 1)
                                 + lat2geo(text.charAt(text.length - 1)))
                    txt.setText(t)
                }
            }
            hintText: "by misha.tavkhelidze@gmail.com v1.1.0"

        }

        Container {
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1.0

            }
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight

            }
            Button {
                id: cls
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 2.0
                }
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
                text: "Clean"
                onClicked: {
                    txt.setText("")
                    txt.requestFocus()
                }
            }
            DropDown {
                id: dd
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 3.0
                }
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center

                onSelectedIndexChanged: {
                    txt.requestFocus()
                    swithInputFlags(selectedOption.value)
                }

                Option {
                    value: 0
                    text: "ქართული"
                    selected: true
                }
                Option {
                    value: 1
                    text: "English"
                }
            }
            Button {
                id: btn
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 2.0
                }
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                text: "Copy"
                onClicked: {
                    _app.copyText(txt.text)
                    Application.minimize();
                }

            }
        }
    }
}
