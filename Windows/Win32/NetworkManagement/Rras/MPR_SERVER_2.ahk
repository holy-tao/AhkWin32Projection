#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used to retrieve and set the number of ports available for the Point-to-Point Tunneling Protocol (PPTP), Layer 2 Tunneling Protocol (L2TP), and Secure Socket Tunneling Protocol (SSTP) on a device.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_server_2
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_SERVER_2 {
    #StructPack 4

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
     * <dt>16,384</dt>
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
     * If <i>dwNumPptpPorts</i> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2008 Standard and Windows Server 2008 Enterprise), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserversetinfo">MprAdminServerSetInfo</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.
     */
    dwNumPptpPorts : UInt32

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
     */
    dwPptpPortFlags : UInt32

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
     * <dt>30,000</dt>
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
     * If <i>dwNumL2tpPorts</i> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2008 Standard and Windows Server 2008 Enterprise), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserversetinfo">MprAdminServerSetInfo</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.
     */
    dwNumL2tpPorts : UInt32

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
     */
    dwL2tpPortFlags : UInt32

    /**
     * Specifies the number of ports configured for SSTP on the device. 
     *  The maximum values for <i>dwNumSstpPorts</i> are listed in the following table. The value zero is not allowed.
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
     * <dt>30,000</dt>
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
     * If <i>dwNumSstpPorts</i> contains a value beyond the limit configured in the registry at service start time (the default is 1000 for Windows Server 2008 Standard and Windows Server 2008 Enterprise), the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mprconfigserversetinfo">MprConfigServerSetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminserversetinfo">MprAdminServerSetInfo</a> functions will return <b>ERROR_SUCCESS_REBOOT_REQUIRED</b>.
     */
    dwNumSstpPorts : UInt32

    /**
     * A set of bitflags that indicate if RAS is enabled on the device.
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
     * </table>
     */
    dwSstpPortFlags : UInt32

}
