#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

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
 * @charset Unicode
 */
export default struct DNS_WINSR_DATAW {
    #StructPack 8

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
     */
    dwMappingFlag : UInt32

    /**
     * The time, in seconds, that a DNS Server attempts resolution using WINS lookup.
     */
    dwLookupTimeout : UInt32

    /**
     * The time, in seconds, that a DNS Server using WINS lookup may cache the WINS Server's response.
     */
    dwCacheTimeout : UInt32

    /**
     * A pointer to a string that represents the domain name to append to the name returned by a WINS reverse-lookup.
     */
    pNameResultDomain : PWSTR

}
