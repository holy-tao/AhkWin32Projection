#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about the session, including name of the computer; name of the user; and active and idle times for the session.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_10
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SESSION_INFO_10 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     */
    sesi10_cname : PWSTR

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     */
    sesi10_username : PWSTR

    /**
     * Specifies the number of seconds the session has been active.
     */
    sesi10_time : UInt32

    /**
     * Specifies the number of seconds the session has been idle.
     */
    sesi10_idle_time : UInt32

}
