#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_OBJECT.ahk" { PEER_OBJECT }
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }

/**
 * The PEER_EVENT_OBJECT_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_OBJECT_CHANGED or PEER_EVENT_MY_OBJECT_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * Peer objects are run-time data items associated with a particular application, such as a picture or avatar, a certificate, or a specific description. Each peer object must be smaller than 16K in size.
 * 
 * Trusted contacts watching this peer object will have a PEER_EVENT_OBJECT_CHANGED event raised on them signaling the peer object's change in status.
 * 
 * The PEER_EVENT_OBJECT_CHANGED event is raised when an object is changed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsetobject">PeerCollabSetObject</a>. If it is the first time the object is set then <b>changeType</b> is set to PEER_CHANGE_ADDED. On subsequent calls of PeerCollabSetObject for the same object ID the <b>changeType</b> is set to PEER_CHANGE_UDPATED.
 * 
 * If <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabdeleteobject">PeerCollabDeleteObject</a> is called the PEER_CHANGE_DELETED event is raised.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_object_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_OBJECT_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the peer contact information for the contact whose peer object data changed.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint information for the contact whose peer object data changed.
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of change that occurred.
     * @deprecated
     */
    changeType : PEER_CHANGE_TYPE

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_object">PEER_OBJECT</a> structure that contains the peer object data whose change raised the event. This most commonly occurs when a new peer object is received by the peer.
     * @deprecated
     */
    pObject : PEER_OBJECT.Ptr

}
