#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a DNS Dynamic Host Configuration Protocol Information (DHCID) resource record (RR) as specified in section 3 of RFC 4701.
 * @remarks
 * The 
 * <b>DNS_DHCID_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_dhcid_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_DHCID_DATA {
    #StructPack 4

    /**
     * The length, in bytes, of <b>DHCID</b>.
     */
    dwByteCount : UInt32

    /**
     * A <b>BYTE</b> array that contains the DHCID client, domain, and SHA-256 digest information as specified in section 4 of <a href="https://www.ietf.org/rfc/rfc2671.txt">RFC 2671</a>.
     */
    DHCID : Int8[1]

}
