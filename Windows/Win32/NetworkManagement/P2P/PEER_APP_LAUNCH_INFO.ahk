#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_INVITATION.ahk" { PEER_INVITATION }
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }

/**
 * The PEER_APP_LAUNCH_INFO structure contains the peer application application launch information provided by a contact in a previous peer invite request.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_app_launch_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_APP_LAUNCH_INFO {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains information about the contact that sent the request to the local peer to launch the application referenced by the application.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the specific endpoint of the contact that sent the request to the local peer to launch the application referenced by the application
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation to launch a specific peer application application on the local peer.
     * @deprecated
     */
    pInvitation : PEER_INVITATION.Ptr

}
