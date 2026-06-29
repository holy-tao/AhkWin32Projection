#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DNS_NAPTR_DATA structure represents a Naming Authority Pointer (NAPTR) DNS Resource Record (RR) as specified in RFC 2915. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The windns.h header defines DNS_NAPTR_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_naptr_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset ANSI
 */
export default struct DNS_NAPTR_DATAA {
    #StructPack 8

    /**
     * A value that determines the NAPTR RR processing order as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    wOrder : UInt16

    /**
     * A value that determines the NAPTR RR processing  order  for records with the same <b>wOrder</b> value as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    wPreference : UInt16

    /**
     * A pointer to a string  that represents a set of NAPTR RR flags which determine the interpretation and processing of NAPTR record fields as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    pFlags : PSTR

    /**
     * A pointer to a string that represents the available services in this rewrite path as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    pService : PSTR

    /**
     * A pointer to a string that represents a substitution expression as defined in sections 2 and 3 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    pRegularExpression : PSTR

    /**
     * A pointer to a string that represents the next NAPTR query name as defined in section 2 of <a href="https://www.ietf.org/rfc/rfc2915.txt">RFC 2915</a>.
     */
    pReplacement : PSTR

}
