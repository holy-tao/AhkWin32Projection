#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRAFFIC_SELECTOR0 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    protocolId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    portStart {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    portEnd {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    startV4Address {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    startV6Address{
        get {
            if(!this.HasProp("__startV6AddressProxyArray"))
                this.__startV6AddressProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__startV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    endV4Address {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    endV6Address{
        get {
            if(!this.HasProp("__endV6AddressProxyArray"))
                this.__endV6AddressProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__endV6AddressProxyArray
        }
    }
}
