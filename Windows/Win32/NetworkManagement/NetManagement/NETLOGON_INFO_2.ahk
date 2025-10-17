#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a level-2 control query response from a domain controller.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-netlogon_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETLOGON_INFO_2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * <tr>
     * <td width="40%"><a id="NETLOGON_VERIFY_STATUS_RETURNED"></a><a id="netlogon_verify_status_returned"></a><dl>
     * <dt><b>NETLOGON_VERIFY_STATUS_RETURNED</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Trust verification status was returned in the <b>netlog2_pdc_connection_status</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    netlog2_flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An enumerated integer value that contains a status code defined in Lmerr.h, with a value greater than 2100.   If <b>NETLOGON_VERIFY_STATUS_RETURNED</b> is set in <b>netlog2_flags</b>, this value represents the trust verification status of all domain members  collectively.
     * @type {Integer}
     */
    netlog2_pdc_connection_status {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A marshaled pointer to a string that contains the name of the trusted domain controller.
     * @type {PWSTR}
     */
    netlog2_trusted_dc_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An enumerated integer value that contains a status code defined in Lmerr.h, with a value greater than 2100. This code shows the status of the secure channel to the specified trusted DC.
     * @type {Integer}
     */
    netlog2_tc_connection_status {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
