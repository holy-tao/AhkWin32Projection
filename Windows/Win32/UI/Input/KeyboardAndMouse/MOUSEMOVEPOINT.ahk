#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the mouse's location in screen coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousemovepoint
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class MOUSEMOVEPOINT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate of the mouse.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate of the mouse.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp of the mouse coordinate.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with this coordinate.
     * @type {Pointer}
     */
    dwExtraInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
