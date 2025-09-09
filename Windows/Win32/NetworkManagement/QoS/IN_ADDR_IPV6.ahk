#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IN_ADDR_IPV6 structure stores an IPv6 address for use with RSVP FILTERSPECs.
 * @remarks
 * When working with IPv4 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-in_addr_ipv6
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IN_ADDR_IPV6 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * IPv6 address.
     * @type {Array<Byte>}
     */
    Addr{
        get {
            if(!this.HasProp("__AddrProxyArray"))
                this.__AddrProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__AddrProxyArray
        }
    }
}
