#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used for limiting connection object enumerations.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CONNECTION_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Uniquely identifies a connection object.
     */
    connectionId : Int64

    /**
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FWPM_CONNECTION_ENUM_FLAG_QUERY_BYTES_TRANSFERRED"></a><a id="fwpm_connection_enum_flag_query_bytes_transferred"></a><dl>
     * <dt><b>FWPM_CONNECTION_ENUM_FLAG_QUERY_BYTES_TRANSFERRED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the IPsec driver will be queried for the current bytes transferred via this connection (allowing monitoring tools to collect accurate data without requiring that querying capabilities remain constantly on). 
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

}
