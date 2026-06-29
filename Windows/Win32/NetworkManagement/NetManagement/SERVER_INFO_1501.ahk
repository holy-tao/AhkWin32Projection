#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1501 structure specifies the number of files that can be open in one session on the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1501
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1501 {
    #StructPack 4

    /**
     * Specifies the number of files that one session can open.
     */
    sv1501_sessopens : UInt32

}
