#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USE_INFO_ASG_TYPE.ahk" { USE_INFO_ASG_TYPE }

/**
 * The USE_INFO_2 structure contains information about a connection between a local computer and a shared resource, including connection type, connection status, user name, and domain name.
 * @remarks
 * Specifying a <b>ui2_local</b> member that is <b>NULL</b> requests authentication with the server without redirecting a drive letter or a device. Future redirections involving the server while the same connection is in effect use the authentication information specified in the initial call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseadd">NetUseAdd</a> function. This information includes the combination of the <b>ui2_password</b>, <b>ui2_username</b>, and <b>ui2_domainname</b> members.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/ns-lmuse-use_info_2
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_INFO_2 {
    #StructPack 8

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the local device name (for example, drive E or LPT1) being redirected to the shared resource. The constant DEVLEN specifies the maximum number of characters in the string. This member can be <b>NULL</b>. For more information, see the following Remarks section.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    ui2_local : PWSTR

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the share name of the remote resource. The string is in the form 
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
     */
    ui2_remote : PWSTR

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the password needed to establish a session with a specific workstation.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    ui2_password : PWSTR

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
     * The connection is successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_PAUSED"></a><a id="use_paused"></a><dl>
     * <dt><b>USE_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Paused by a local workstation.
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
     */
    ui2_status : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    ui2_asg_type : USE_INFO_ASG_TYPE

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files, directories, and other processes that are open on the remote resource. This element is not used by the 
     * <b>NetUseAdd</b> function.
     */
    ui2_refcount : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of explicit connections (redirection with a local device name) or implicit UNC connections (redirection without a local device name) that are established with the resource.
     */
    ui2_usecount : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a string that contains the name of the user who initiated the connection.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    ui2_username : PWSTR

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that contains the domain name of the remote resource.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    ui2_domainname : PWSTR

}
