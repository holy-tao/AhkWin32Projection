#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DNS_WINS_DATA structure represents a DNS Windows Internet Name Service (WINS) record.
 * @remarks
 * The 
 * <b>DNS_WINS_DATA</b> structure is used in conjunction with the 
 * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wins_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_WINS_DATA {
    #StructPack 4

    /**
     * The WINS mapping flag that specifies whether the record must be included in zone replication. <b>dwMappingFlag</b> must be one of these mutually exclusive values:
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
     * The number of WINS Servers listed in <b>WinsServers</b>.
     */
    cWinsServerCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-ip4_array">IP4_ARRAY</a> structures that contain the IPv4 address of the WINS lookup Servers.
     */
    WinsServers : UInt32[1]

}
