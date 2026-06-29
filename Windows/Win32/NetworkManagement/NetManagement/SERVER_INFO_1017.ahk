#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1017 structure contains the network announce rate associated with the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1017
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1017 {
    #StructPack 4

    /**
     * Specifies the network announce rate, in seconds. This rate determines how often the server is announced to other computers on the network. 
     * 
     * 
     * 
     * 
     * For more information about how much the announce rate can vary from the period of time specified by this member, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_info_1018">SERVER_INFO_1018</a>.
     */
    sv1017_announce : UInt32

}
