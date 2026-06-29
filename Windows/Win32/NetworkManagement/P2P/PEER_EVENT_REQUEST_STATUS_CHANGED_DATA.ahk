#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The PEER_EVENT_REQUEST_STATUS_CHANGED_DATA structure contains information returned when a PEER_EVENT_REQUEST_STATUS_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * This event is raised when the infrastructure  finishes processing the request for <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a>. If the  process fails <b>hrChange</b> value will most typically be PEER_E_CONNECTION_FAILED.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_request_status_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_REQUEST_STATUS_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint information for the contact whose change in request status raised the event.
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

    /**
     * HRESULT value that indicates the change in request status that occurred.
     */
    hrChange : HRESULT

}
