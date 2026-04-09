#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NETWORK_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NETWORK_ADDRESS_LIST extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AddressCount {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {NETWORK_ADDRESS}
     */
    Address {
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 6, 1, NETWORK_ADDRESS, "")
            return this.__AddressProxyArray
        }
    }
}
