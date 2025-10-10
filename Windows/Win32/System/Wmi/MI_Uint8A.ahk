#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of MI_Uint8 types.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_uint8a
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Uint8A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <b>MI_Uint8</b> types.
     * @type {Pointer<Byte>}
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
