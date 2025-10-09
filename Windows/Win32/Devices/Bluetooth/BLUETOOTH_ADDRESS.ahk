#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ullLong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    rgBytes{
        get {
            if(!this.HasProp("__rgBytesProxyArray"))
                this.__rgBytesProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__rgBytesProxyArray
        }
    }
}
