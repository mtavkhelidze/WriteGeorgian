import bb.cascades 1.0

Page {

    id: pg
    property string gt: ""
    keyListeners: [
        KeyListener {
            onKeyEvent: {
                //                txt.text = gt
            }
            onKeyPressed: {
                //                txt.text = gt
            }
            onKeyReleased: {
                //                gt = gt + "მ"
                //                txt.text = gt
            }

        }

    ]
    Container {
        id: cont_ed
        layout: StackLayout {
        }
        TextArea {
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
            onTextChanging: {
                if (dd.selectedOption.value == 0) {
                    txt.text = text.substr(0, text.length - 1) + lat2geo(text.charAt(text.length - 1))
                }
            }

            id: txt
            maximumLength: -1
            preferredHeight: 700.0
            preferredWidth: 800.0
            hintText: "დაწერეთ აქ..."
            
            keyListeners: [
                KeyListener {
                    onKeyEvent: {
                        //                        txt.text = gt
                    }
                    onKeyPressed: {
                        //                        txt.text = gt
                    }
                    onKeyReleased: {
                        //                        txt.text = gt
                    }
                }
            ]
            textFormat: TextFormat.Plain
            focusPolicy: FocusPolicy.Default
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight

            }
            DropDown {
                id: dd
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
                
                onOpacityChanged: {
                    txt.requestFocus()
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
                text: "Copy"
                onClicked: {
                    _app.copyText(txt.text)
                    Application.minimize();
                }

            }
        }
    }
}