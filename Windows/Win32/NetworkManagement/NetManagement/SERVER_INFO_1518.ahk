#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1518 structure specifies whether the server is visible to LAN Manager 2.x clients.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1518
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1518 {
    #StructPack 4

    /**
     * Specifies whether the server is visible to LAN Manager 2.<i>x</i> clients.
     */
    sv1518_lmannounce : BOOL

}
