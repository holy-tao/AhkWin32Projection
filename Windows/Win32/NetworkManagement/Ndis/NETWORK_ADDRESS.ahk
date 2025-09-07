#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NETWORK_ADDRESS extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    AddressLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
