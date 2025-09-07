#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEUP extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__rgbProxyArray
        }
    }
}
