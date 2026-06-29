#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1544 structure specifies the initial number of tree connections to be allocated in the connection table.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1544
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1544 {
    #StructPack 4

    /**
     * Specifies the initial number of tree connections to be allocated in the connection table. The server automatically increases the table as necessary, so setting the member to a higher value is an optimization.
     */
    sv1544_initconntable : UInt32

}
