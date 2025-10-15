#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The DNS_TXT_DATA structure represents a DNS text (TXT) record as specified in section 3.3.14 of RFC 1035.
 * @remarks
 * 
  * The 
  * <b>DNS_TXT_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_TXT_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_txt_dataa
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset ANSI
 */
class DNS_TXT_DATAA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of strings represented in <b>pStringArray</b>.
     * @type {Integer}
     */
    dwStringCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of strings representing the descriptive text of the TXT resource record.
     * @type {Array<PSTR>}
     */
    pStringArray{
        get {
            if(!this.HasProp("__pStringArrayProxyArray"))
                this.__pStringArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, PSTR, "")
            return this.__pStringArrayProxyArray
        }
    }
}
