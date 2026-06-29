#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1528 structure specifies the period of time that the scavenger remains idle before waking up to service requests.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1528
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1528 {
    #StructPack 4

    /**
     * Specifies the period of time, in seconds, that the scavenger remains idle before waking up to service requests. A smaller value for this member improves the response of the server to various events but costs CPU cycles.
     */
    sv1528_scavtimeout : UInt32

}
