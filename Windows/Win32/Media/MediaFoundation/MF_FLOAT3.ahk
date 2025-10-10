#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A vector with three components.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-mf_float3
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_FLOAT3 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * X component of the vector.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Y component of the vector.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Z component of the vector.
     * @type {Float}
     */
    z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
