#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an IPv4 address.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-ipv4address
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class Ipv4Address extends Win32Struct {
    static sizeof => 4

    static packingSize => 1

    /**
     * An array that contains an IPv4 network address in network byte order.
     * @type {Array<Integer>}
     */
    addr {
        get {
            if(!this.HasProp("__addrProxyArray"))
                this.__addrProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__addrProxyArray
        }
    }
}
