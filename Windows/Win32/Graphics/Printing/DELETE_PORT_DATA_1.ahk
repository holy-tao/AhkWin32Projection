#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class DELETE_PORT_DATA_1 extends Win32Struct
{
    static sizeof => 236

    static packingSize => 4

    /**
     * @type {String}
     */
    psztPortName {
        get => StrGet(this.ptr + 0, 63, "UTF-16")
        set => StrPut(value, this.ptr + 0, 63, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 128, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }
}
