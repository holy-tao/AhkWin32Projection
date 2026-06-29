#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SESSION_INFO_USER_FLAGS.ahk" { SESSION_INFO_USER_FLAGS }

/**
 * Contains information about the session, including name of the computer; name of the user; and open files, pipes, and devices on the computer.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_1
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SESSION_INFO_1 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     */
    sesi1_cname : PWSTR

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     */
    sesi1_username : PWSTR

    /**
     * Specifies a DWORD value that contains the number of files, devices, and pipes opened during the session.
     */
    sesi1_num_opens : UInt32

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been active.
     */
    sesi1_time : UInt32

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been idle.
     */
    sesi1_idle_time : UInt32

    sesi1_user_flags : SESSION_INFO_USER_FLAGS

}
