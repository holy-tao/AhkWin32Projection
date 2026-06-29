#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1107 structure specifies the number of users that can simultaneously log on to the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1107
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1107 {
    #StructPack 4

    /**
     * Specifies the number of users who can attempt to log on to the system server. Note that it is the license server that determines how many of these users can actually log on.
     */
    sv1107_users : UInt32

}
