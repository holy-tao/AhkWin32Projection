#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1536 structure specifies whether the server allows clients to use opportunistic locks (oplocks) on files.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1536
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1536 {
    #StructPack 4

    /**
     * Specifies whether the server allows clients to use oplocks on files. Opportunistic locks are a significant performance enhancement, but have the potential to cause lost cached data on some networks, particularly wide-area networks.
     */
    sv1536_enableoplocks : BOOL

}
