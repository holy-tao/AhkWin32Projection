#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of MI_Char16 types.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_char16a
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Char16A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <b>MI_Char16</b> types.
     * @type {Pointer<UInt16>}
     */
    data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of items in data array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
