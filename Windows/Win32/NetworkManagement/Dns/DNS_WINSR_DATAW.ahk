#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DNS_WINSR_DATA structure represents a DNS Windows Internet Name Service reverse-lookup (WINSR) record. (Unicode)
 * @remarks
 * The 
  * <b>DNS_WINSR_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The windns.h header defines DNS_WINSR_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_winsr_dataw
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 * @charset Unicode
 */
class DNS_WINSR_DATAW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The WINS mapping flag that specifies whether the record must be included into the zone replication. <b>dwMappingFlag</b> must be one of these mutually exclusive values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_WINS_FLAG_SCOPE"></a><a id="dns_wins_flag_scope"></a><dl>
     * <dt><b>DNS_WINS_FLAG_SCOPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record is not local, replicate across zones.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DNS_WINS_FLAG_LOCAL"></a><a id="dns_wins_flag_local"></a><dl>
     * <dt><b>DNS_WINS_FLAG_LOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Record is local, do not replicate.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwMappingFlag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time, in seconds, that a DNS Server attempts resolution using WINS lookup.
     * @type {Integer}
     */
    dwLookupTimeout {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The time, in seconds, that a DNS Server using WINS lookup may cache the WINS Server's response.
     * @type {Integer}
     */
    dwCacheTimeout {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a string that represents the domain name to append to the name returned by a WINS reverse-lookup.
     * @type {PWSTR}
     */
    pNameResultDomain{
        get {
            if(!this.HasProp("__pNameResultDomain"))
                this.__pNameResultDomain := PWSTR(this.ptr + 16)
            return this.__pNameResultDomain
        }
    }
}
