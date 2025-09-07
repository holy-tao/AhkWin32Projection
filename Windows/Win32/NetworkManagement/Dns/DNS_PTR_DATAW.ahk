#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DNS_PTR_DATA structure represents a DNS pointer (PTR) record as specified in section 3.3.12 of RFC 1035. (Unicode)
 * @remarks
 * The 
  * <b>DNS_PTR_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_PTR_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_ptr_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_PTR_DATAW extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a string that represents the pointer (PTR) record data.
     * @type {PWSTR}
     */
    pNameHost{
        get {
            if(!this.HasProp("__pNameHost"))
                this.__pNameHost := PWSTR(this.ptr + 0)
            return this.__pNameHost
        }
    }
}
