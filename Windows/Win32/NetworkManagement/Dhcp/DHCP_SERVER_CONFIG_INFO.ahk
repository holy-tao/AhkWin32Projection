#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_SERVER_CONFIG_INFO structure defines the data used to configure the DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_config_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_CONFIG_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

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
     * @type {Integer}
     */
    APIProtocolSupport {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Unicode string that specifies the  file name of the client lease JET database.
     * @type {Pointer<Ptr>}
     */
    DatabaseName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Unicode string that specifies the absolute path to <b>DatabaseName</b>.
     * @type {Pointer<Ptr>}
     */
    DatabasePath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Unicode string that specifies the absolute path and file name of the backup client lease JET database.
     * @type {Pointer<Ptr>}
     */
    BackupPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the interval, in minutes,  between backups of the client lease database.
     * @type {Integer}
     */
    BackupInterval {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

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
     * @type {Integer}
     */
    DatabaseLoggingFlag {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

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
     * @type {Integer}
     */
    RestoreFlag {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the interval, in minutes,  between cleanup operations  performed on the client lease database.
     * @type {Integer}
     */
    DatabaseCleanupInterval {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved. This field should be set to 0x00000000.
     * @type {Integer}
     */
    DebugFlag {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
