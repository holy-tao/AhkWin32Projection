#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_WAN_FRAGMENT extends Win32Struct {
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    RemoteAddress {
        get {
            if(!this.HasProp("__RemoteAddressProxyArray"))
                this.__RemoteAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__RemoteAddressProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    LocalAddress {
        get {
            if(!this.HasProp("__LocalAddressProxyArray"))
                this.__LocalAddressProxyArray := Win32FixedArray(this.ptr + 6, 6, Primitive, "char")
            return this.__LocalAddressProxyArray
        }
    }
}
