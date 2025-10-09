#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_INFO_RSP extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    result {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dataLen {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    connectionlessMTU {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 8, 44, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
