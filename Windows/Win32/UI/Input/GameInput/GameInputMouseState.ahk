#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputMouseButtons.ahk" { GameInputMouseButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputMouseState {
    #StructPack 8

    buttons : GameInputMouseButtons

    positionX : Int64

    positionY : Int64

    wheelX : Int64

    wheelY : Int64

}
