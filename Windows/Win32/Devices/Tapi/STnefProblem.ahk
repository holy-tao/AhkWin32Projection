#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class STnefProblem extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulComponent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulAttribute {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    scode {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
