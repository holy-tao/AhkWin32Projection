#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputArcadeStickInfo {
    #StructPack 4

    menuButtonLabel : GameInputLabel

    viewButtonLabel : GameInputLabel

    stickUpLabel : GameInputLabel

    stickDownLabel : GameInputLabel

    stickLeftLabel : GameInputLabel

    stickRightLabel : GameInputLabel

    actionButton1Label : GameInputLabel

    actionButton2Label : GameInputLabel

    actionButton3Label : GameInputLabel

    actionButton4Label : GameInputLabel

    actionButton5Label : GameInputLabel

    actionButton6Label : GameInputLabel

    specialButton1Label : GameInputLabel

    specialButton2Label : GameInputLabel

}
