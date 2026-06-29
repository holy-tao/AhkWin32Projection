#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * Contains the IP addresses and data associated with a peer endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_pnrp_endpoint_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_PNRP_ENDPOINT_INFO {
    #StructPack 8

    /**
     * The peer name associated with this peer endpoint.
     */
    pwzPeerName : PWSTR

    /**
     * The number of SOCKADDR structures in <b>pAddresses</b>.
     */
    cAddresses : UInt32

    /**
     * Pointer to an array of pointers to SOCKADDR structures that contain the IP addresses for the peer endpoint's network interface.
     */
    ppAddresses : IntPtr

    /**
     * Pointer to a zero-terminated Unicode string that contains a comment for this peer endpoint.
     */
    pwzComment : PWSTR

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains application-specific data for the peer endpoint (such as a message or an image).
     * @deprecated
     */
    payload : PEER_DATA

}
