#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_IPv6_ADDRESS extends Win32Struct {
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    rgbAddress {
        get {
            if(!this.HasProp("__rgbAddressProxyArray"))
                this.__rgbAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__rgbAddressProxyArray
        }
    }
}
