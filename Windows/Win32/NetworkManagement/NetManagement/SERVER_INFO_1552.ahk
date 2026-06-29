#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1552 structure specifies the maximum time allowed for a link delay.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1552
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1552 {
    #StructPack 4

    /**
     * Specifies the maximum time allowed for a link delay, in seconds. If delays exceed this number, the server disables raw I/O for this connection.
     */
    sv1552_maxlinkdelay : UInt32

}
