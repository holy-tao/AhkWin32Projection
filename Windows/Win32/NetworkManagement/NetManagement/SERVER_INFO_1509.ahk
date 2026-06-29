#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1509 structure specifies the maximum raw mode buffer size.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1509
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1509 {
    #StructPack 4

    /**
     * Specifies the maximum raw mode buffer size, in bytes.
     */
    sv1509_maxrawbuflen : UInt32

}
