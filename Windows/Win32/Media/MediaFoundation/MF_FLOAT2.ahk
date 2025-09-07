#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A vector with two components.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mf_float2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_FLOAT2 extends Win32Struct
{
    static sizeof => 8

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
}
