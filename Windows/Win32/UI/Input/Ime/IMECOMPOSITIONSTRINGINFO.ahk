#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information of IME's composition string in an app.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imecompositionstringinfo
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMECOMPOSITIONSTRINGINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Length (number of <b>WCHAR</b>s) of composition string.
     * @type {Integer}
     */
    iCompStrLen {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Caret position of composition string.
     * @type {Integer}
     */
    iCaretPos {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Position of composition string that is editable.
     * @type {Integer}
     */
    iEditStart {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Length of composition string that is editable.
     * @type {Integer}
     */
    iEditLen {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Start position of target phrase of composition string.
     * @type {Integer}
     */
    iTargetStart {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Target phrase length of composition string.
     * @type {Integer}
     */
    iTargetLen {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
