#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_NULL_DATA structure represents NULL data for a DNS resource record as specified in section 3.3.10 of RFC 1035.
 * @remarks
 * The 
 * <b>DNS_NULL_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_null_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_NULL_DATA {
    #StructPack 4

    /**
     * The number of bytes represented in <b>Data</b>.
     */
    dwByteCount : UInt32

    /**
     * Null data.
     */
    Data : Int8[1]

}
