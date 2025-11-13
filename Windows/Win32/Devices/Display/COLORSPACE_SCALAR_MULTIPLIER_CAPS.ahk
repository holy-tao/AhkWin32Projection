#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_SCALAR_MULTIPLIER_CAPS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    Valid {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Float}
     */
    NumericRangeMin {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    NumericRangeMax {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
