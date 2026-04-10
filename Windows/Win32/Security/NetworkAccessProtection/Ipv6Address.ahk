#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an IPv6 address.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-ipv6address
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class Ipv6Address extends Win32Struct {
    static sizeof => 16

    static packingSize => 1

    /**
     * An array that contains an IPv6 network address in network byte order.
     * @type {Array<Integer>}
     */
    addr {
        get {
            if(!this.HasProp("__addrProxyArray"))
                this.__addrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__addrProxyArray
        }
    }
}
