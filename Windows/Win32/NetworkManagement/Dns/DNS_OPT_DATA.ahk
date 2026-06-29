#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a DNS Option (OPT) resource record (RR) as specified in section 4 of RFC 2671.
 * @remarks
 * The 
 * <b>DNS_OPT_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_opt_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_OPT_DATA {
    #StructPack 2

    /**
     * The length, in bytes, of <b>Data</b>.
     */
    wDataLength : UInt16

    /**
     * Reserved. Do not use.
     */
    wPad : UInt16

    /**
     * A <b>BYTE</b> array that contains variable transport level information as specified in section 4 of <a href="https://www.ietf.org/rfc/rfc2671.txt">RFC 2671</a>.
     */
    Data : Int8[1]

}
