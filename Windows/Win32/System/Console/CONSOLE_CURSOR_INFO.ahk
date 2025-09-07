#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the size and visibility information about the about the console cursor.
 * @see https://learn.microsoft.com/windows/console/console-cursor-info-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class CONSOLE_CURSOR_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The percentage of the character cell that is filled by the cursor. This value is between 1 and 100. The cursor appearance varies, ranging from completely filling the cell to showing up as a horizontal line at the bottom of the cell.
     * 
     * > [!NOTE]
     * >While the **dwSize** value is normally between 1 and 100, under some circumstances a value outside of that range might be returned. For example, if **CursorSize** is set to 0 in the registry, the **dwSize** value returned would be 0.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The visibility of the cursor. If the cursor is visible, this member is **TRUE**.
     * @type {Integer}
     */
    bVisible {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
