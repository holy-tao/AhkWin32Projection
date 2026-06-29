#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1530 structure specifies the minimum number of available receive work items the server requires to begin processing a server message block.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1530
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1530 {
    #StructPack 4

    /**
     * Specifies the minimum number of available receive work items that the server requires to begin processing a server message block. A larger value for this member ensures that work items are available more frequently for nonblocking requests, but it also increases the likelihood that blocking requests will be rejected.
     */
    sv1530_minfreeworkitems : UInt32

}
