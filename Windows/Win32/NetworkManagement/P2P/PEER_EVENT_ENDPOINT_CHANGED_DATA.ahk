#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }

/**
 * The PEER_EVENT_ENDPOINT_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_CHANGED or PEER_EVENT_MY_ENDPOINT_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * This event is raised when information about the endpoint changes. An example of this being the endpoint name in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure is changed using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsetendpointname">PeerCollabSetEndpointName</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_endpoint_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_ENDPOINT_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the contact information for the contact who changed endpoints.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the new active endpoint for  the peer specified in <i>pContact</i>.
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

}
