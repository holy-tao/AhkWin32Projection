#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_MINFO_DATA structure represents a DNS mail information (MINFO) record as specified in section 3.3.7 of RFC 1035.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_minfo_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_MINFO_DATAW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a string that represents the <a href="https://docs.microsoft.com/windows/win32/dns/f-gly">fully qualified domain name</a> (FQDN) of the mailbox responsible for the mailing list or mailbox specified in the record's owner name.
     * @type {PWSTR}
     */
    pNameMailbox {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a string that represents the FQDN of the mailbox to receive error messages related to the mailing list.
     * @type {PWSTR}
     */
    pNameErrorsMailbox {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
