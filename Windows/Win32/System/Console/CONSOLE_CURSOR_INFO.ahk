#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the size and visibility information about the about the console cursor.
 * @see https://learn.microsoft.com/windows/console/console-cursor-info-str
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLE_CURSOR_INFO {
    #StructPack 4

    /**
     * The percentage of the character cell that is filled by the cursor. This value is between 1 and 100. The cursor appearance varies, ranging from completely filling the cell to showing up as a horizontal line at the bottom of the cell.
     * 
     * > [!NOTE]
     * >While the **dwSize** value is normally between 1 and 100, under some circumstances a value outside of that range might be returned. For example, if **CursorSize** is set to 0 in the registry, the **dwSize** value returned would be 0.
     */
    dwSize : UInt32

    /**
     * The visibility of the cursor. If the cursor is visible, this member is **TRUE**.
     */
    bVisible : BOOL

}
