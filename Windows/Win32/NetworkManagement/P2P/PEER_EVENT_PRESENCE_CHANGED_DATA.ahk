#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_PRESENCE_INFO.ahk" { PEER_PRESENCE_INFO }
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }

/**
 * The PEER_EVENT_PRESENCE_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_PRESENCE_CHANGED or PEER_EVENT_MY_PRESENCE_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_presence_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_PRESENCE_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the peer contact information for the contact whose change in presence raised the event.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint information for the contact whose change in presence raised the event.
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of presence change that occurred.
     * @deprecated
     */
    changeType : PEER_CHANGE_TYPE

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_presence_info">PEER_PRESENCE_INFO</a> structure that contains the updated presence information for the endpoint of the contact whose change in presence raised the event.
     * @deprecated
     */
    pPresenceInfo : PEER_PRESENCE_INFO.Ptr

}
