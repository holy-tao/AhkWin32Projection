#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DUAL_LAYER_MIDDLE_ZONE_START_ADDRESS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ShiftedMiddleAreaStartAddress{
        get {
            if(!this.HasProp("__ShiftedMiddleAreaStartAddressProxyArray"))
                this.__ShiftedMiddleAreaStartAddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ShiftedMiddleAreaStartAddressProxyArray
        }
    }
}
