#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the virtual IP address assigned to a session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_session_address
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SESSION_ADDRESS {
    #StructPack 4

    /**
     * A null-terminated string that contains the address family. Always set this member to "AF_INET".
     */
    AddressFamily : UInt32

    /**
     * The virtual IP address assigned to the session. The format of this address is identical to that used in the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_address">WTS_CLIENT_ADDRESS</a> structure.
     */
    Address : Int8[20]

}
