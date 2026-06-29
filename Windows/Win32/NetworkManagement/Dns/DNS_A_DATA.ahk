#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_A_DATA structure represents a DNS address (A) record as specified in section 3.4.1 of RFC 1035.
 * @remarks
 * The 
 * <b>DNS_A_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_A_DATA {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-data-types">IP4_ADDRESS</a> data type that contains an IPv4 address.
     */
    IpAddress : UInt32

}
