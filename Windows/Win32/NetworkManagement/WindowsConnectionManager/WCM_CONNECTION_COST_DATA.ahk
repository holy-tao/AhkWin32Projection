#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCM_CONNECTION_COST_SOURCE.ahk" { WCM_CONNECTION_COST_SOURCE }

/**
 * Specifies information about a connection cost.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_connection_cost_data
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_CONNECTION_COST_DATA {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the connection cost type.
     * 
     * 
     * This must include one (and only one) of the following flags:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_UNKNOWN"></a><a id="wcm_connection_cost_unknown"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_UNKNOWN</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connection cost information is not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_UNRESTRICTED"></a><a id="wcm_connection_cost_unrestricted"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_UNRESTRICTED</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is unlimited and has unrestricted usage constraints.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_FIXED"></a><a id="wcm_connection_cost_fixed"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_FIXED</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Usage counts toward a fixed allotment of data which the user has already paid for (or agreed to pay for).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_VARIABLE"></a><a id="wcm_connection_cost_variable"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_VARIABLE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection cost is on a per-byte basis.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * And may include any combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_OVERDATALIMIT"></a><a id="wcm_connection_cost_overdatalimit"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_OVERDATALIMIT</b></dt>
     * <dt>0x10000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection has exceeded its data limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_CONGESTED"></a><a id="wcm_connection_cost_congested"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_CONGESTED</b></dt>
     * <dt>0x20000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is throttled due to high traffic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCM_CONNECTION_COST_ROAMING"></a><a id="wcm_connection_cost_roaming"></a><dl>
     * <dt><b>WCM_CONNECTION_COST_ROAMING</b></dt>
     * <dt>0x40000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is outside of the home network.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ConnectionCost : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_connection_cost_source">WCM_CONNECTION_COST_SOURCE</a></b>
     * 
     * Specifies the cost source.
     */
    CostSource : WCM_CONNECTION_COST_SOURCE

}
