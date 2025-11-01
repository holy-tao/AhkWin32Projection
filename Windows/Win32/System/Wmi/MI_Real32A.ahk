#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of MI_Real32 types.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_real32a
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Real32A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <b>MI_Real32</b> types.
     * @type {Pointer<Float>}
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
