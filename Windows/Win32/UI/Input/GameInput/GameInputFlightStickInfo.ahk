#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLabel.ahk" { GameInputLabel }
#Import ".\GameInputSwitchKind.ahk" { GameInputSwitchKind }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputFlightStickInfo {
    #StructPack 4

    menuButtonLabel : GameInputLabel

    viewButtonLabel : GameInputLabel

    firePrimaryButtonLabel : GameInputLabel

    fireSecondaryButtonLabel : GameInputLabel

    hatSwitchKind : GameInputSwitchKind

}
