#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1516 structure specifies whether the server is a reliable time source.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1516
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1516 {
    #StructPack 4

    /**
     * Specifies whether the server is a reliable time source.
     */
    sv1516_timesource : BOOL

}
