#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents an NSEC resource record (RR) as specified in section 4 of RFC 4034. (ANSI)
 * @remarks
 * The 
 * <b>DNS_NSEC_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_NSEC_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_nsec_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset ANSI
 */
export default struct DNS_NSEC_DATAA {
    #StructPack 8

    /**
     * A pointer to a string that represents the authoritative owner name of the next domain in the canonical ordering of the zone as specified in section 4.1.1 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     */
    pNextDomainName : PSTR

    /**
     * The length, in bytes, of <b>TypeBitMaps</b>.
     */
    wTypeBitMapsLength : UInt16

    /**
     * Reserved. Do not use.
     */
    wPad : UInt16

    /**
     * A <b>BYTE</b> array that contains a bitmap that specifies which RR types are supported by the NSEC RR owner. Each bit in the array corresponds to a <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-constants">DNS Record Type</a> as defined in section in section 4.1.2 of <a href="https://www.ietf.org/rfc/rfc4034.txt">RFC 4034</a>.
     */
    TypeBitMaps : Int8[1]

}
