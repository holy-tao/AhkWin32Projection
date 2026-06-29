#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1010 structure contains the auto-disconnect time associated with the specified server.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1010
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1010 {
    #StructPack 4

    /**
     * Specifies the auto-disconnect time, in minutes. 
     * 
     * 
     * 
     * 
     * If a session is idle longer than the period of time specified by this member, the server disconnects the session. If the value of this member is SV_NODISC, auto-disconnect is not enabled.
     */
    sv1010_disc : Int32

}
