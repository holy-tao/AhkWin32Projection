#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1550 structure specifies the percentage of free disk space remaining before an alert message is sent.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1550
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1550 {
    #StructPack 4

    /**
     * Specifies the percentage of free disk space remaining before an alert message is sent.
     */
    sv1550_diskspacethreshold : UInt32

}
