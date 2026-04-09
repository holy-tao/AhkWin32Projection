#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputUiNavigationButtons.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputUiNavigationState extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {GameInputUiNavigationButtons}
     */
    buttons {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
