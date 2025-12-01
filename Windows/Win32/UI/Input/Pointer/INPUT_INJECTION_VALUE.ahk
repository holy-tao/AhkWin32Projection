#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the input injection details.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-input_injection_value
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class INPUT_INJECTION_VALUE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The Usage Page ID, such as VR Controls Page (0x03) or Game Controls Page (0x05).
     * @type {Integer}
     */
    page {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The Usage ID associated with a Usage Page, such as Turn Right/Left (21) or Move Right/Left (24) for a Game Controls Page.
     * @type {Integer}
     */
    usage {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The injected input value.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The Usage index, such as the selected item in a  radio button set.
     * @type {Integer}
     */
    index {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
