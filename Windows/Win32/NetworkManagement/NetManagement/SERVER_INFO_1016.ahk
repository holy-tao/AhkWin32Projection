#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVER_INFO_HIDDEN.ahk" { SERVER_INFO_HIDDEN }

/**
 * The SERVER_INFO_1016 structure contains information about whether the server is visible to other computers in the same network domain.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1016
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1016 {
    #StructPack 4

    sv1016_hidden : SERVER_INFO_HIDDEN

}
