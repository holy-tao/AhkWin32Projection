#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * Contains the information provided by a peer identity when it registers with a PNRP cloud.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_pnrp_registration_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_PNRP_REGISTRATION_INFO {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains the name of the PNRP cloud for which this peer identity is requesting registration. If <b>NULL</b>, the registration will be made in all clouds.  It is possible to use the special value PEER_PNRP_ALL_LINK_CLOUDS to register in all link local clouds.
     */
    pwzCloudName : PWSTR

    /**
     * Pointer to a Unicode string that contains the name of the peer identity requesting registration.
     */
    pwzPublishingIdentity : PWSTR

    /**
     * The number of SOCKADDR structures in <b>ppAddresses</b>. It is possible to use the special value PEER_PNRP_AUTO_ADDRESSES to have the infrastructure automatically choose addresses.
     */
    cAddresses : UInt32

    /**
     * Pointer to an array of pointers to SOCKADDR structures that contain the IP addresses bound to the network interface of the peer identity requesting registration.
     */
    ppAddresses : IntPtr

    /**
     * The network interface port assigned to the address that the peer is publishing.
     */
    wPort : UInt16

    /**
     * Pointer to a zero-terminated Unicode string that contains a comment for this peer endpoint.
     */
    pwzComment : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains a pointer to an opaque byte buffer containing application-specific data for the peer endpoint (such as a message or an image).
     * @deprecated
     */
    payload : PEER_DATA

}
