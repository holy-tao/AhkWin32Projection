#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class HARDWARE_ADDRESS extends Win32Struct {
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    Address {
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
