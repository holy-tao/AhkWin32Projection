#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputArcadeStickButtons.ahk" { GameInputArcadeStickButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputArcadeStickState {
    #StructPack 4

    buttons : GameInputArcadeStickButtons

}
