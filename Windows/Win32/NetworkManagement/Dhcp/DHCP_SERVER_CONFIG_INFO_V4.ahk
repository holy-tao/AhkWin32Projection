#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Defines the data used to configure the DHCP server.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_server_config_info_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SERVER_CONFIG_INFO_V4 extends Win32Struct
{
    static sizeof => 80

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
     * @type {PWSTR}
     */
    DatabaseName{
        get {
            if(!this.HasProp("__DatabaseName"))
                this.__DatabaseName := PWSTR(this.ptr + 8)
            return this.__DatabaseName
        }
    }

    /**
     * Unicode string that specifies the absolute path to <b>DatabaseName</b>.
     * @type {PWSTR}
     */
    DatabasePath{
        get {
            if(!this.HasProp("__DatabasePath"))
                this.__DatabasePath := PWSTR(this.ptr + 16)
            return this.__DatabasePath
        }
    }

    /**
     * Unicode string that specifies the absolute path and file name of the backup client lease JET database.
     * @type {PWSTR}
     */
    BackupPath{
        get {
            if(!this.HasProp("__BackupPath"))
                this.__BackupPath := PWSTR(this.ptr + 24)
            return this.__BackupPath
        }
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

    /**
     * Specifies a value equal to or greater than 0 or less than 6 that indicates the number of times to ping an unresponsive client before determining unavailability.
     * @type {Integer}
     */
    dwPingRetries {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Specifies the size of <b>wszBootTableString</b>, in bytes.
     * @type {Integer}
     */
    cbBootTableString {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Unicode string that contains the boot table string for the DHCP server. ?? More information needed. ??
     * @type {PWSTR}
     */
    wszBootTableString{
        get {
            if(!this.HasProp("__wszBootTableString"))
                this.__wszBootTableString := PWSTR(this.ptr + 64)
            return this.__wszBootTableString
        }
    }

    /**
     * Specifies whether or not to enable audit logging on the DHCP server. A value of <b>TRUE</b> indicates that an audit log is generated; <b>FALSE</b> indicates that audit logging is not performed.
     * @type {BOOL}
     */
    fAuditLog{
        get {
            if(!this.HasProp("__fAuditLog"))
                this.__fAuditLog := BOOL(this.ptr + 72)
            return this.__fAuditLog
        }
    }
}
