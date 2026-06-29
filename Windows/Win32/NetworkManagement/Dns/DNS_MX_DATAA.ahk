#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DNS_MX_DATA structure represents a DNS mail exchanger (MX) record as specified in section 3.3.9 of RFC 1035. (ANSI)
 * @remarks
 * The 
 * <b>DNS_MX_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_MX_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_mx_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset ANSI
 */
export default struct DNS_MX_DATAA {
    #StructPack 8

    /**
     * A pointer to a string that represents the fully qualified domain name (FQDN) of the host willing to act as a mail exchange.
     */
    pNameExchange : PSTR

    /**
     * A preference given to this resource record among others of the same owner. Lower values are preferred.
     */
    wPreference : UInt16

    /**
     * Reserved for padding. Do not use.
     */
    Pad : UInt16

}
