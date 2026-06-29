#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DNS_MINFO_DATA structure represents a DNS mail information (MINFO) record as specified in section 3.3.7 of RFC 1035. (Unicode)
 * @remarks
 * The 
 * <b>DNS_MINFO_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The windns.h header defines DNS_MINFO_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_minfo_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @charset Unicode
 */
export default struct DNS_MINFO_DATAW {
    #StructPack 8

    /**
     * A pointer to a string that represents the <a href="https://docs.microsoft.com/windows/win32/dns/f-gly">fully qualified domain name</a> (FQDN) of the mailbox responsible for the mailing list or mailbox specified in the record's owner name.
     */
    pNameMailbox : PWSTR

    /**
     * A pointer to a string that represents the FQDN of the mailbox to receive error messages related to the mailing list.
     */
    pNameErrorsMailbox : PWSTR

}
