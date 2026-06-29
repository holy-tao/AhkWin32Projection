#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputUiNavigationButtons.ahk" { GameInputUiNavigationButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputUiNavigationState {
    #StructPack 4

    buttons : GameInputUiNavigationButtons

}
