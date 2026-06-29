#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a level-1 control query response from a domain controller.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-netlogon_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETLOGON_INFO_1 {
    #StructPack 4

    /**
     * An integer value that contains one or more of the following control query responses from the DC.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_REPLICATION_NEEDED"></a><a id="netlogon_replication_needed"></a><dl>
     * <dt><b>NETLOGON_REPLICATION_NEEDED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_REPLICATION_IN_PROGRESS"></a><a id="netlogon_replication_in_progress"></a><dl>
     * <dt><b>NETLOGON_REPLICATION_IN_PROGRESS</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_FULL_SYNC_REPLICATION"></a><a id="netlogon_full_sync_replication"></a><dl>
     * <dt><b>NETLOGON_FULL_SYNC_REPLICATION</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_REDO_NEEDED"></a><a id="netlogon_redo_needed"></a><dl>
     * <dt><b>NETLOGON_REDO_NEEDED</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_HAS_IP"></a><a id="netlogon_has_ip"></a><dl>
     * <dt><b>NETLOGON_HAS_IP</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Trusted domain DC has an IP address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_HAS_TIMESERV"></a><a id="netlogon_has_timeserv"></a><dl>
     * <dt><b>NETLOGON_HAS_TIMESERV</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Trusted domain DC runs the Windows Time Service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETLOGON_DNS_UPDATE_FAILURE"></a><a id="netlogon_dns_update_failure"></a><dl>
     * <dt><b>NETLOGON_DNS_UPDATE_FAILURE</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Last update to the DNS records on the DC failed.
     * 
     * </td>
     * </tr>
     * </table>
     */
    netlog1_flags : UInt32

    /**
     * An enumerated integer value that contains a status code defined in Lmerr.h, with a value greater than 2100.  This value applies only to backup domain controllers, and shows the status of the secure channel connection to the PDC in their domain.
     */
    netlog1_pdc_connection_status : UInt32

}
