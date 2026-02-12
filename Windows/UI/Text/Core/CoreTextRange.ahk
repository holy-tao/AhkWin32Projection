#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a range of text inside a text input control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextrange
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextRange extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The start position of a range in Application Character Position (ACP) terms.
     * @type {Integer}
     */
    StartCaretPosition {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The end position of a range in Application Character Position (ACP) terms.
     * @type {Integer}
     */
    EndCaretPosition {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
