#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_STATS_VECTOR structure contains statistics from the RPC run-time library on a per-server basis.
 * @remarks
 * The statistics vector contains a count member (<b>Count</b>), followed by an array of statistics. To obtain run-time statistics, an application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtinqstats">RpcMgmtInqStats</a>. The RPC run-time library allocates memory for the statistics vector. The application calls 
  * <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtstatsvectorfree">RpcMgmtStatsVectorFree</a> to free the statistics vector.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_stats_vector
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_STATS_VECTOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Number of statistics values present in the array <b>Stats</b>.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of unsigned long integers representing server statistics that contains <b>Count</b> elements. Each array element contains an unsigned long value from the following list. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_STATS_CALLS_IN"></a><a id="rpc_c_stats_calls_in"></a><dl>
     * <dt><b>RPC_C_STATS_CALLS_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of remote procedure calls received by the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_STATS_CALLS_OUT"></a><a id="rpc_c_stats_calls_out"></a><dl>
     * <dt><b>RPC_C_STATS_CALLS_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of remote procedure calls initiated by the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_STATS_PKTS_IN"></a><a id="rpc_c_stats_pkts_in"></a><dl>
     * <dt><b>RPC_C_STATS_PKTS_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of network packets received by the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RPC_C_STATS_PKTS_OUT"></a><a id="rpc_c_stats_pkts_out"></a><dl>
     * <dt><b>RPC_C_STATS_PKTS_OUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of network packets sent by the server.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Array<UInt32>}
     */
    Stats{
        get {
            if(!this.HasProp("__StatsProxyArray"))
                this.__StatsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__StatsProxyArray
        }
    }
}
