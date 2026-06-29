#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The SERVER_INFO_1515 structure specifies whether the server should force a client to disconnect once the client's logon time has expired.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1515
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1515 {
    #StructPack 4

    /**
     * Specifies whether the server should force a client to disconnect, even if the client has open files, once the client's logon time has expired.
     */
    sv1515_enableforcedlogoff : BOOL

}
