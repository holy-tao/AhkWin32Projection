#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies a change in the state of a button associated with a pointer.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_button_change_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class POINTE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
