#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1510 structure specifies the maximum number of users that can be logged on to the specified server using a single virtual circuit.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1510
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1510 {
    #StructPack 4

    /**
     * Specifies the maximum number of users that can be logged on to a server using a single virtual circuit.
     */
    sv1510_sessusers : UInt32

}
