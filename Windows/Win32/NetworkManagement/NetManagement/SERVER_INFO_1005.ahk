#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The SERVER_INFO_1005 structure contains a comment that describes the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1005
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1005 {
    #StructPack 8

    /**
     * Pointer to a string that contains a comment describing the server. The comment can be null.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    sv1005_comment : PWSTR

}
