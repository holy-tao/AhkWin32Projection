#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1502 structure specifies the maximum number of virtual circuits per client for the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1502
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1502 {
    #StructPack 4

    /**
     * Specifies the maximum number of virtual circuits permitted per client.
     */
    sv1502_sessvcs : UInt32

}
