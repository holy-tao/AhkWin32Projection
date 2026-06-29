#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputUiNavigationInfo {
    #StructPack 4

    menuButtonLabel : GameInputLabel

    viewButtonLabel : GameInputLabel

    acceptButtonLabel : GameInputLabel

    cancelButtonLabel : GameInputLabel

    upButtonLabel : GameInputLabel

    downButtonLabel : GameInputLabel

    leftButtonLabel : GameInputLabel

    rightButtonLabel : GameInputLabel

    contextButton1Label : GameInputLabel

    contextButton2Label : GameInputLabel

    contextButton3Label : GameInputLabel

    contextButton4Label : GameInputLabel

    pageUpButtonLabel : GameInputLabel

    pageDownButtonLabel : GameInputLabel

    pageLeftButtonLabel : GameInputLabel

    pageRightButtonLabel : GameInputLabel

    scrollUpButtonLabel : GameInputLabel

    scrollDownButtonLabel : GameInputLabel

    scrollLeftButtonLabel : GameInputLabel

    scrollRightButtonLabel : GameInputLabel

    guideButtonLabel : GameInputLabel

}
