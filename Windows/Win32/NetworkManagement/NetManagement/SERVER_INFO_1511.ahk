#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1511 structure specifies the maximum number of tree connections that users can make with a single virtual circuit.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1511
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1511 {
    #StructPack 4

    /**
     * Specifies the maximum number of tree connections that users can make with a single virtual circuit.
     */
    sv1511_sessconns : UInt32

}
