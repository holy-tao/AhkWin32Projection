#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_403 structure contains information about a specified server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_403
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_403 extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the user list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     * @type {Integer}
     */
    sv403_ulist_mtime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the group list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     * @type {Integer}
     */
    sv403_glist_mtime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the access control list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     * @type {Integer}
     */
    sv403_alist_mtime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a string that specifies the list of user names on the server. Spaces separate the names.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Char>}
     */
    sv403_alerts {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    sv403_security {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of administrators the server can accommodate at one time.
     * @type {Integer}
     */
    sv403_numadmin {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The order in which the network device drivers are served.
     * @type {Integer}
     */
    sv403_lanmask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of a reserved account for guest users on the server. The UNLEN constant specifies the maximum number of characters in the string.
     * @type {Pointer<Char>}
     */
    sv403_guestacct {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character devices that can be shared on the server.
     * @type {Integer}
     */
    sv403_chdevs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character device queues that can coexist on the server.
     * @type {Integer}
     */
    sv403_chdevq {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character device jobs that can be pending at one time on the server.
     * @type {Integer}
     */
    sv403_chdevjobs {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections allowed on the server.
     * @type {Integer}
     */
    sv403_connections {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of share names the server can accommodate.
     * @type {Integer}
     */
    sv403_shares {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open at once on the server.
     * @type {Integer}
     */
    sv403_openfiles {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that one session can open.
     * @type {Integer}
     */
    sv403_sessopens {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of virtual circuits permitted per client.
     * @type {Integer}
     */
    sv403_sessvcs {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of simultaneous requests a client can make on a single virtual circuit.
     * @type {Integer}
     */
    sv403_sessreqs {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     * @type {Integer}
     */
    sv403_opensearch {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of file locks that can be active at the same time.
     * @type {Integer}
     */
    sv403_activelocks {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of server buffers that are provided.
     * @type {Integer}
     */
    sv403_numreqbuf {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     * @type {Integer}
     */
    sv403_sizreqbuf {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of 64K server buffers provided.
     * @type {Integer}
     */
    sv403_numbigbuf {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of processes that can access the operating system at the same time.
     * @type {Integer}
     */
    sv403_numfiletasks {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The alert interval, in seconds, for notifying an administrator of a network event.
     * @type {Integer}
     */
    sv403_alertsched {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of entries that can be written to the error log, in any one interval, before notifying an administrator. The interval is specified by the <b>sv403_alertsched</b> member.
     * @type {Integer}
     */
    sv403_erroralert {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The  number of invalid attempts that a user tries to logon before notifying an administrator.
     * @type {Integer}
     */
    sv403_logonalert {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of invalid file access attempts to allow before notifying an administrator.
     * @type {Integer}
     */
    sv403_accessalert {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of free disk space at which the system sends a message notifying an administrator that free space on a disk is low. This value is expressed as the number of kilobytes of free disk space remaining on the disk.
     * @type {Integer}
     */
    sv403_diskalert {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The network I/O error ratio, in tenths of a percent, that is allowed before notifying an administrator.
     * @type {Integer}
     */
    sv403_netioalert {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum audit file size in kilobytes. The audit file traces user activity.
     * @type {Integer}
     */
    sv403_maxauditsz {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains flags that are used to control operations on a server.
     * @type {Pointer<Char>}
     */
    sv403_srvheuristics {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The audit event control mask.
     * @type {Integer}
     */
    sv403_auditedevents {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

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
     * @type {Integer}
     */
    sv403_autoprofile {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the path for the profile.
     * @type {Pointer<Char>}
     */
    sv403_autopath {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
