#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_PING_RSP extends Win32Struct
{
    static sizeof => 45

    static packingSize => 1

    /**
     * @type {Integer}
     */
    dataLen {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
