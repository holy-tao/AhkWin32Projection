#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1503 structure specifies the number of search operations that can be carried out simultaneously.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1503
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1503 {
    #StructPack 4

    /**
     * Specifies the number of search operations that can be carried out simultaneously.
     */
    sv1503_opensearch : UInt32

}
