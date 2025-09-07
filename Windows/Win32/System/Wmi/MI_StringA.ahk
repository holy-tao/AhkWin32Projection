#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of pointers to null-terminated MI_Char* strings.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_stringa
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_StringA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of pointers to null-terminated <b>MI_Char</b>* strings.
     * @type {Pointer<UInt16>}
     */
    data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of items in the array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
