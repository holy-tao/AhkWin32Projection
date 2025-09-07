#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DNS_WINS_DATA structure represents a DNS Windows Internet Name Service (WINS) record.
 * @remarks
 * The 
  * <b>DNS_WINS_DATA</b> structure is used in conjunction with the 
  * <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_recorda">DNS_RECORD</a> structure to programmatically manage DNS entries.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_wins_data
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_WINS_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

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
     * The number of WINS Servers listed in <b>WinsServers</b>.
     * @type {Integer}
     */
    cWinsServerCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/windns/ns-windns-ip4_array">IP4_ARRAY</a> structures that contain the IPv4 address of the WINS lookup Servers.
     * @type {Array<UInt32>}
     */
    WinsServers{
        get {
            if(!this.HasProp("__WinsServersProxyArray"))
                this.__WinsServersProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "uint")
            return this.__WinsServersProxyArray
        }
    }
}
