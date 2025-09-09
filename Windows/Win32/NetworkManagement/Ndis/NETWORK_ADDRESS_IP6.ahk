#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NETWORK_ADDRESS_IP6 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    sin6_port {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    sin6_flowinfo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt16>}
     */
    sin6_addr{
        get {
            if(!this.HasProp("__sin6_addrProxyArray"))
                this.__sin6_addrProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ushort")
            return this.__sin6_addrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    sin6_scope_id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
