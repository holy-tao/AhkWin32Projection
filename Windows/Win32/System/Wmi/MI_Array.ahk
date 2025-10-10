#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Generalized type that represents an array. It can be generalized because all arrays are the same size, except the data element type will be specialized.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_array
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Array extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the array of values.
     * @type {Pointer<Void>}
     */
    data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
