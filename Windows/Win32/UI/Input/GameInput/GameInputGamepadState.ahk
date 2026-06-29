#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputGamepadButtons.ahk" { GameInputGamepadButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputGamepadState {
    #StructPack 4

    buttons : GameInputGamepadButtons

    leftTrigger : Float32

    rightTrigger : Float32

    leftThumbstickX : Float32

    leftThumbstickY : Float32

    rightThumbstickX : Float32

    rightThumbstickY : Float32

}
