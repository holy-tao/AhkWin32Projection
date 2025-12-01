#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\L2TP_TUNNEL_CONFIG_PARAMS2.ahk

/**
 * Used to get and set the device configuration for Layer 2 Tunneling Protocol (L2TP) on a RAS Server. (L2TP_CONFIG_PARAMS1)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-l2tp_config_params1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class L2TP_CONFIG_PARAMS1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A value that specifies the number of ports configured on the RRAS server to accept L2TP connections. The maximum values for <b>dwNumPorts</b> are listed in the following table. The value zero is not allowed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Web Server 2008
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2008 Standard
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>30000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2008 Datacenter and Windows Server 2008 Enterprise
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  If <b>dwNumPorts</b> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2008 Standard and Windows Server 2008 Enterprise), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigservergetinfoex">MprConfigServerGetInfoEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfoex">MprConfigServerSetInfoEx</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwNumPorts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the type of ports configured on the  RRAS server for L2TP. The following values are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPR_ENABLE_RAS_ON_DEVICE"></a><a id="mpr_enable_ras_on_device"></a><dl>
     * <dt><b>MPR_ENABLE_RAS_ON_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, RAS is enabled on the device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPR_ENABLE_ROUTING_ON_DEVICE"></a><a id="mpr_enable_routing_on_device"></a><dl>
     * <dt><b>MPR_ENABLE_ROUTING_ON_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, routing is enabled on the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwPortFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwTunnelConfigParamFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {L2TP_TUNNEL_CONFIG_PARAMS2}
     */
    TunnelConfigParams{
        get {
            if(!this.HasProp("__TunnelConfigParams"))
                this.__TunnelConfigParams := L2TP_TUNNEL_CONFIG_PARAMS2(16, this)
            return this.__TunnelConfigParams
        }
    }
}
