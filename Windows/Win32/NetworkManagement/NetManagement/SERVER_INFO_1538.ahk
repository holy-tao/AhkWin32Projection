#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1538 structure specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1538
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1538 {
    #StructPack 4

    /**
     * Specifies whether several MS-DOS File Control Blocks (FCBs) are placed in a single location accessible to the server.
     */
    sv1538_enablefcbopens : BOOL

}
