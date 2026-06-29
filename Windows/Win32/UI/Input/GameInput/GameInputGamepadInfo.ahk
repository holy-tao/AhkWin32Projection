#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputGamepadInfo {
    #StructPack 4

    menuButtonLabel : GameInputLabel

    viewButtonLabel : GameInputLabel

    aButtonLabel : GameInputLabel

    bButtonLabel : GameInputLabel

    xButtonLabel : GameInputLabel

    yButtonLabel : GameInputLabel

    dpadUpLabel : GameInputLabel

    dpadDownLabel : GameInputLabel

    dpadLeftLabel : GameInputLabel

    dpadRightLabel : GameInputLabel

    leftShoulderButtonLabel : GameInputLabel

    rightShoulderButtonLabel : GameInputLabel

    leftThumbstickButtonLabel : GameInputLabel

    rightThumbstickButtonLabel : GameInputLabel

}
