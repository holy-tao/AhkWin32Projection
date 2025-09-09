#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IN_ADDR_IPV4 union stores an IPv4 address for use with RSVP FILTERSPECs.
 * @remarks
 * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-in_addr_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IN_ADDR_IPV4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * IPv4 address, expressed as a ULONG.
     * @type {Integer}
     */
    Addr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * IPv4 address, expressed as four UCHARs.
     * @type {Array<Byte>}
     */
    AddrBytes{
        get {
            if(!this.HasProp("__AddrBytesProxyArray"))
                this.__AddrBytesProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__AddrBytesProxyArray
        }
    }
}
