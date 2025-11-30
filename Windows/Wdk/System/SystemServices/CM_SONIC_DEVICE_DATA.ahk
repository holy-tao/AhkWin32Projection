#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class CM_SONIC_DEVICE_DATA extends Win32Struct
{
    static sizeof => 14

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    DataConfigurationRegister {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    EthernetAddress{
        get {
            if(!this.HasProp("__EthernetAddressProxyArray"))
                this.__EthernetAddressProxyArray := Win32FixedArray(this.ptr + 6, 8, Primitive, "char")
            return this.__EthernetAddressProxyArray
        }
    }
}
