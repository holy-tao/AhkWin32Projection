#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IP6_ADDRESS.ahk" { IP6_ADDRESS }

/**
 * The DNS_AAAA_DATA structure represents a DNS IPv6 (AAAA) record as specified in RFC 3596.
 * @remarks
 * The 
 * <b>DNS_AAAA_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_aaaa_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_AAAA_DATA {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-ip6_address">IP6_ADDRESS</a> data type that contains an IPv6 address.
     */
    Ip6Address : IP6_ADDRESS

}
