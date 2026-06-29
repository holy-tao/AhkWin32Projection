#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SERVER_INFO_SECURITY.ahk" { SERVER_INFO_SECURITY }

/**
 * Contains information about a specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_402
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_402 {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the user list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv402_ulist_mtime : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the group list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv402_glist_mtime : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The last time the access control list was modified. The value is expressed as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT, and applies to servers running with user-level security.
     */
    sv402_alist_mtime : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the list of user names on the server. Spaces separate the names.
     */
    sv402_alerts : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    sv402_security : SERVER_INFO_SECURITY

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of administrators the server can accommodate at one time.
     */
    sv402_numadmin : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The order in which the network device drivers are served.
     */
    sv402_lanmask : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of a reserved account for guest users on the server. The constant UNLEN specifies the maximum number of characters in the string.
     */
    sv402_guestacct : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character-oriented devices that can be shared on the server.
     */
    sv402_chdevs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of character-oriented device queues that can coexist on the server.
     */
    sv402_chdevq : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of  character-oriented device jobs that can be pending at one time on the server.
     */
    sv402_chdevjobs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of connections allowed on the server.
     */
    sv402_connections : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of share names the server can accommodate.
     */
    sv402_shares : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that can be open at once on the server.
     */
    sv402_openfiles : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of files that one session can open.
     */
    sv402_sessopens : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum number of virtual circuits permitted per client.
     */
    sv402_sessvcs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of simultaneous requests a client can make on a single virtual circuit.
     */
    sv402_sessreqs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of search operations that can be carried out simultaneously.
     */
    sv402_opensearch : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of file locks that can be active at the same time.
     */
    sv402_activelocks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of server buffers provided.
     */
    sv402_numreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each server buffer.
     */
    sv402_sizreqbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of 64K server buffers provided.
     */
    sv402_numbigbuf : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of processes that can access the operating system at one time.
     */
    sv402_numfiletasks : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The interval, in seconds, for notifying an administrator of a network event.
     */
    sv402_alertsched : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of entries that can be written to the error log, in any one interval, before notifying an administrator. The interval is specified by the <b>sv402_alertsched</b>  member.
     */
    sv402_erroralert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of invalid logon attempts to allow a user before notifying an administrator.
     */
    sv402_logonalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of invalid file access attempts to allow before notifying an administrator.
     */
    sv402_accessalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The point at which the system sends a message notifying an administrator that free space on a disk is low. This value is expressed as the number of kilobytes of free disk space remaining on the disk.
     */
    sv402_diskalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The network I/O error ratio, in tenths of a percent, that is allowed before notifying an administrator.
     */
    sv402_netioalert : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum size, in kilobytes, of the audit file. The audit file traces user activity.
     */
    sv402_maxauditsz : UInt32

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string containing flags that control operations on a server.
     */
    sv402_srvheuristics : PWSTR

}
