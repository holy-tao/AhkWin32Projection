#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used for limiting connection object enumerations.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CONNECTION_ENUM_TEMPLATE0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Uniquely identifies a connection object.
     * @type {Integer}
     */
    connectionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
