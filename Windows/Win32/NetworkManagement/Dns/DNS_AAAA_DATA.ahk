#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IP6_ADDRESS.ahk

/**
 * The DNS_AAAA_DATA structure represents a DNS IPv6 (AAAA) record as specified in RFC 3596.
 * @remarks
 * The 
  * <b>DNS_AAAA_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_aaaa_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_AAAA_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-ip6_address">IP6_ADDRESS</a> data type that contains an IPv6 address.
     * @type {IP6_ADDRESS}
     */
    Ip6Address{
        get {
            if(!this.HasProp("__Ip6Address"))
                this.__Ip6Address := IP6_ADDRESS(this.ptr + 0)
            return this.__Ip6Address
        }
    }
}
