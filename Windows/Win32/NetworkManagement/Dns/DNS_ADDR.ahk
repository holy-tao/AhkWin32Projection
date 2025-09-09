#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A DNS_ADDR structure stores an IPv4 or IPv6 address.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_addr
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_ADDR extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A value that contains the socket IP address. It is a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr_in</a> structure if the address is IPv4 and a sockaddr_in6 structure if the address is IPv6.
     * @type {String}
     */
    MaxSa {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {Array<UInt32>}
     */
    DnsAddrUserDword{
        get {
            if(!this.HasProp("__DnsAddrUserDwordProxyArray"))
                this.__DnsAddrUserDwordProxyArray := Win32FixedArray(this.ptr + 64, 8, Primitive, "uint")
            return this.__DnsAddrUserDwordProxyArray
        }
    }
}
