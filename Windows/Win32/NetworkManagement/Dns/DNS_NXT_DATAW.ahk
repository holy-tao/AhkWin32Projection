#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DNS_NXT_DATA structure represents a DNS next (NXT) resource record (RR) as specified in section 5 of RFC 2535. (Unicode)
 * @remarks
 * The 
 * <b>DNS_NXT_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_NXT_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_nxt_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset Unicode
 */
export default struct DNS_NXT_DATAW {
    #StructPack 8

    /**
     * A pointer to a string that represents the name of the next domain.
     */
    pNameNext : PWSTR

    /**
     * The number of elements in the <b>wTypes</b> array. <b>wNumTypes</b> must be 2 or greater but cannot exceed 8.
     */
    wNumTypes : UInt16

    /**
     * A <b>BYTE</b> array that contains a bitmap which specifies the RR types that are present  in the next domain. Each bit in the array corresponds to a <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> as defined in section 5.2 of <a href="https://www.ietf.org/rfc/rfc2535.txt">RFC 2535</a>.
     */
    wTypes : UInt16[1]

}
