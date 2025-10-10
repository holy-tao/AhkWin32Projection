#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to retrieve and set the number of ports available for the Point-to-Point Tunneling Protocol (PPTP) and Layer 2 Tunneling Protocol (L2TP) on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_server_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_SERVER_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the number of ports configured for PPTP on the device. 
     * The maximum values for <i>dwNumPptpPorts</i> are listed in the following table. The value zero is not allowed.
     * 
     * <table>
     * <tr>
     * <th>Maximum Value</th>
     * <th>Windows Version</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2003, Web Edition
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
     * Windows Server 2003, Standard Edition
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>16,384</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2003, Datacenter Edition and Windows Server 2003, Enterprise Edition
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwNumPptpPorts</i> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2003, Standard Edition and Windows Server 2003, Enterprise Edition), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserversetinfo">MprAdminServerSetInfo</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.
     * @type {Integer}
     */
    dwNumPptpPorts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A set of bitflags that indicate if RAS or Routing is enabled on the device.
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
     * If set, Routing is enabled on the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwPptpPortFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of ports configured for L2TP on the device. 
     * The maximum values for <i>dwNumL2tpPorts</i> are listed in the following table. The value zero is not allowed.
     * 
     * <table>
     * <tr>
     * <th>Maximum Value</th>
     * <th>Windows Version</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2003, Web Edition
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
     * Windows Server 2003, Standard Edition
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>30,000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2003, Datacenter Edition and Windows Server 2003, Enterprise Edition
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwNumL2tpPorts</i> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2003, Standard Edition and Windows Server 2003, Enterprise Edition), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserversetinfo">MprAdminServerSetInfo</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.
     * @type {Integer}
     */
    dwNumL2tpPorts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A set of bitflags that indicate if RAS or Routing is enabled on the device.
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
     * If set, Routing is enabled on the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwL2tpPortFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
