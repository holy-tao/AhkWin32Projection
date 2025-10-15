#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The DNS_MX_DATA structure represents a DNS mail exchanger (MX) record as specified in section 3.3.9 of RFC 1035.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_mx_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_MX_DATAA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a string that represents the fully qualified domain name (FQDN) of the host willing to act as a mail exchange.
     * @type {PSTR}
     */
    pNameExchange{
        get {
            if(!this.HasProp("__pNameExchange"))
                this.__pNameExchange := PSTR(this.ptr + 0)
            return this.__pNameExchange
        }
    }

    /**
     * A preference given to this resource record among others of the same owner. Lower values are preferred.
     * @type {Integer}
     */
    wPreference {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Reserved for padding. Do not use.
     * @type {Integer}
     */
    Pad {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
