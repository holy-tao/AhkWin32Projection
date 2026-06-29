#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COORD.ahk" { COORD }
#Import ".\SMALL_RECT.ahk" { SMALL_RECT }

/**
 * See reference information about the CONSOLE_SELECTION_INFO structure, which contains information for a console selection.
 * @see https://learn.microsoft.com/windows/console/console-selection-info-str
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_SELECTION_INFO {
    #StructPack 4

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
     */
    dwFlags : UInt32

    /**
     * A [**COORD**](coord-str.md) structure that specifies the selection anchor, in characters.
     */
    dwSelectionAnchor : COORD

    /**
     * A [**SMALL\_RECT**](small-rect-str.md) structure that specifies the selection rectangle.
     */
    srSelection : SMALL_RECT

}
