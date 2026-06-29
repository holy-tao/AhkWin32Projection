#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SERVER_INFO_SECURITY.ahk" { SERVER_INFO_SECURITY }

/**
 * The SERVER_INFO_403 structure contains information about a specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_403
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_403 {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the user list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv403_ulist_mtime : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the group list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv403_glist_mtime : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the access control list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv403_alist_mtime : UInt32

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that specifies the list of user names on the server. Spaces separate the names.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    sv403_alerts : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    sv403_security : SERVER_INFO_SECURITY

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of administrators the server can accommodate at one time.
     */
    sv403_numadmin : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The order in which the network device drivers are served.
     */
    sv403_lanmask : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of a reserved account for guest users on the server. The UNLEN constant specifies the maximum number of characters in the string.
     */
    sv403_guestacct : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character devices that can be shared on the server.
     */
    sv403_chdevs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character device queues that can coexist on the server.
     */
    sv403_chdevq : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character device jobs that can be pending at one time on the server.
     */
    sv403_chdevjobs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections allowed on the server.
     */
    sv403_connections : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of share names the server can accommodate.
     */
    sv403_shares : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open at once on the server.
     */
    sv403_openfiles : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that one session can open.
     */
    sv403_sessopens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of virtual circuits permitted per client.
     */
    sv403_sessvcs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of simultaneous requests a client can make on a single virtual circuit.
     */
    sv403_sessreqs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     */
    sv403_opensearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of file locks that can be active at the same time.
     */
    sv403_activelocks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of server buffers that are provided.
     */
    sv403_numreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     */
    sv403_sizreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of 64K server buffers provided.
     */
    sv403_numbigbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of processes that can access the operating system at the same time.
     */
    sv403_numfiletasks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The alert interval, in seconds, for notifying an administrator of a network event.
     */
    sv403_alertsched : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of entries that can be written to the error log, in any one interval, before notifying an administrator. The interval is specified by the <b>sv403_alertsched</b> member.
     */
    sv403_erroralert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The  number of invalid attempts that a user tries to logon before notifying an administrator.
     */
    sv403_logonalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of invalid file access attempts to allow before notifying an administrator.
     */
    sv403_accessalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of free disk space at which the system sends a message notifying an administrator that free space on a disk is low. This value is expressed as the number of kilobytes of free disk space remaining on the disk.
     */
    sv403_diskalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The network I/O error ratio, in tenths of a percent, that is allowed before notifying an administrator.
     */
    sv403_netioalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum audit file size in kilobytes. The audit file traces user activity.
     */
    sv403_maxauditsz : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains flags that are used to control operations on a server.
     */
    sv403_srvheuristics : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The audit event control mask.
     */
    sv403_auditedevents : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A value that controls the action of the server on the profile. The following values are predefined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SW_AUTOPROF_LOAD_MASK"></a><a id="sw_autoprof_load_mask"></a><dl>
     * <dt><b>SW_AUTOPROF_LOAD_MASK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server loads the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SW_AUTOPROF_SAVE_MASK"></a><a id="sw_autoprof_save_mask"></a><dl>
     * <dt><b>SW_AUTOPROF_SAVE_MASK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The server saves the profile.
     * 
     * </td>
     * </tr>
     * </table>
     */
    sv403_autoprofile : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the path for the profile.
     */
    sv403_autopath : PWSTR

}
