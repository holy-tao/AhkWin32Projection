#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1539 structure specifies whether the server processes raw Server Message Blocks (SMBs).
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1539
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1539 {
    #StructPack 4

    /**
     * Specifies whether the server processes raw SMBs. If enabled, this member allows more data to be transferred per transaction and improves performance. However, it is possible that processing raw SMBs can impede performance on certain networks. The server maintains the value of this member.
     */
    sv1539_enableraw : BOOL

}
