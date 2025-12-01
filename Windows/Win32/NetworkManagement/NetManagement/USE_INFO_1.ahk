#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the connection between a local device and a shared resource.
 * @remarks
 * Specifying a <b>ui1_local</b> member that is <b>NULL</b> requests authentication with the server without redirecting a drive letter or a device. Future redirections involving the server while the same connection is in effect use the password specified by the <b>ui1_password</b> member in the initial call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseadd">NetUseAdd</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/ns-lmuse-use_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the local device name (for example, drive E or LPT1) being redirected to the shared resource. The constant DEVLEN specifies the maximum number of characters in the string. This member can be <b>NULL</b>. For more information, see the following Remarks section.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    ui1_local {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the share name of the remote resource being accessed. The string is in the form: 
     * 
     * 
     * 
     * 
     * 
     * ``` syntax
     * \\servername\sharename
     * 
     * ```
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    ui1_remote {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the password needed to establish a session between a specific workstation and a server.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    ui1_password {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The status of the connection. This element is not used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseadd">NetUseAdd</a> function. The following values are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_OK"></a><a id="use_ok"></a><dl>
     * <dt><b>USE_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_PAUSED"></a><a id="use_paused"></a><dl>
     * <dt><b>USE_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Paused by local workstation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_SESSLOST"></a><a id="use_sesslost"></a><dl>
     * <dt><b>USE_SESSLOST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_DISCONN"></a><a id="use_disconn"></a><dl>
     * <dt><b>USE_DISCONN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_NETERR"></a><a id="use_neterr"></a><dl>
     * <dt><b>USE_NETERR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_CONN"></a><a id="use_conn"></a><dl>
     * <dt><b>USE_CONN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is being made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_RECONN"></a><a id="use_reconn"></a><dl>
     * <dt><b>USE_RECONN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reconnecting.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ui1_status {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    ui1_asg_type {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files, directories, and other processes that are open on the remote resource. This element is not used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseadd">NetUseAdd</a> function.
     * @type {Integer}
     */
    ui1_refcount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of  explicit connections (redirection with a local device name) or implicit UNC connections (redirection without a local device name) that are established with the resource.
     * @type {Integer}
     */
    ui1_usecount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
