#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1523 structure specifies the length of time the server retains information about incomplete search operations.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1523
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1523 {
    #StructPack 4

    /**
     * Specifies the length of time the server retains information about incomplete search operations.
     */
    sv1523_maxkeepsearch : UInt32

}
