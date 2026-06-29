#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines the data used to configure the DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SERVER_CONFIG_INFO_V4 {
    #StructPack 8

    /**
     * Specifies a set of bit flags that contain the RPC protocols supported by the DHCP server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_SERVER_USE_RPC_OVER_TCPIP"></a><a id="dhcp_server_use_rpc_over_tcpip"></a><dl>
     * <dt><b>DHCP_SERVER_USE_RPC_OVER_TCPIP</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TCP/IP can be used for DHCP API RPC calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_SERVER_USE_RPC_OVER_NP"></a><a id="dhcp_server_use_rpc_over_np"></a><dl>
     * <dt><b>DHCP_SERVER_USE_RPC_OVER_NP</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Named pipes can be used for DHCP API RPC calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_SERVER_USE_RPC_OVER_LPC"></a><a id="dhcp_server_use_rpc_over_lpc"></a><dl>
     * <dt><b>DHCP_SERVER_USE_RPC_OVER_LPC</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Local Procedure Call (LPC) can be used for local DHCP API RPC calls.
     * 
     * </td>
     * </tr>
     * </table>
     */
    APIProtocolSupport : UInt32

    /**
     * Unicode string that specifies the  file name of the client lease JET database.
     */
    DatabaseName : PWSTR

    /**
     * Unicode string that specifies the absolute path to <b>DatabaseName</b>.
     */
    DatabasePath : PWSTR

    /**
     * Unicode string that specifies the absolute path and file name of the backup client lease JET database.
     */
    BackupPath : PWSTR

    /**
     * Specifies the interval, in minutes,  between backups of the client lease database.
     */
    BackupInterval : UInt32

    /**
     * Specifies a bit flag that indicates whether or not database actions should be logged.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All database operations will be logged.
     * 
     * </td>
     * </tr>
     * </table>
     */
    DatabaseLoggingFlag : UInt32

    /**
     * Specifies a bit flag that indicates whether or not a database restore operation should be performed.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client lease database should be restored from the path and file specified in <b>BackupPath</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    RestoreFlag : UInt32

    /**
     * Specifies the interval, in minutes,  between cleanup operations  performed on the client lease database.
     */
    DatabaseCleanupInterval : UInt32

    /**
     * Reserved. This field should be set to 0x00000000.
     */
    DebugFlag : UInt32

    /**
     * Specifies a value equal to or greater than 0 or less than 6 that indicates the number of times to ping an unresponsive client before determining unavailability.
     */
    dwPingRetries : UInt32

    /**
     * Specifies the size of <b>wszBootTableString</b>, in bytes.
     */
    cbBootTableString : UInt32

    /**
     * Unicode string that contains the boot table string for the DHCP server. ?? More information needed. ??
     */
    wszBootTableString : PWSTR

    /**
     * Specifies whether or not to enable audit logging on the DHCP server. A value of <b>TRUE</b> indicates that an audit log is generated; <b>FALSE</b> indicates that audit logging is not performed.
     */
    fAuditLog : BOOL

}
