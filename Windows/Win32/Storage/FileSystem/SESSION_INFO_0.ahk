#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the name of the computer that established the session.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SESSION_INFO_0 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains the name of the computer that established the session. This string cannot contain a backslash (\\).
     */
    sesi0_cname : PWSTR

}
