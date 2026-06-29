#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputMouseButtons.ahk" { GameInputMouseButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputMouseInfo {
    #StructPack 4

    supportedButtons : GameInputMouseButtons

    sampleRate : UInt32

    sensorDpi : UInt32

    hasWheelX : Int8

    hasWheelY : Int8

}
