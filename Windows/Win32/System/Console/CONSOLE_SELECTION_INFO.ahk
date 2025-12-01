#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk
#Include .\SMALL_RECT.ahk

/**
 * See reference information about the CONSOLE_SELECTION_INFO structure, which contains information for a console selection.
 * @see https://learn.microsoft.com/windows/console/console-selection-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_SELECTION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The selection indicator. This member can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CONSOLE_MOUSE_DOWN** 0x0008 | Mouse is down. The user is actively adjusting the selection rectangle with a mouse. |
     * | **CONSOLE_MOUSE_SELECTION** 0x0004 | Selecting with the mouse. If off, the user is operating `conhost.exe` mark mode selection with the keyboard. |
     * | **CONSOLE_NO_SELECTION** 0x0000 | No selection. |
     * | **CONSOLE_SELECTION_IN_PROGRESS** 0x0001 | Selection has begun. If a mouse selection, this will typically not occur without the `CONSOLE_SELECTION_NOT_EMPTY` flag. If a keyboard selection, this may occur when mark mode has been entered but the user is still navigating to the initial position. |
     * | **CONSOLE_SELECTION_NOT_EMPTY** 0x0002 | Selection rectangle not empty. The payload of *dwSelectionAnchor* and *srSelection* are valid.  |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [**COORD**](coord-str.md) structure that specifies the selection anchor, in characters.
     * @type {COORD}
     */
    dwSelectionAnchor{
        get {
            if(!this.HasProp("__dwSelectionAnchor"))
                this.__dwSelectionAnchor := COORD(4, this)
            return this.__dwSelectionAnchor
        }
    }

    /**
     * A [**SMALL\_RECT**](small-rect-str.md) structure that specifies the selection rectangle.
     * @type {SMALL_RECT}
     */
    srSelection{
        get {
            if(!this.HasProp("__srSelection"))
                this.__srSelection := SMALL_RECT(8, this)
            return this.__srSelection
        }
    }
}
