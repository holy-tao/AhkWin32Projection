#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import ".\PEER_APPLICATION.ahk" { PEER_APPLICATION }
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }

/**
 * The PEER_EVENT_APPLICATION_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_APPLICATION_CHANGED or PEER_EVENT_MY_APPLICATION_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * "Application" is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
 * 
 * A peer's application has a GUID representing a single specific application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To deregister a peer's application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
 * 
 * When a new application is registered locally using PeerCollabRegisterApplication or unregistered using PeerCollabUnregisterApplication all peers subscribed to the local peer's presence information receive the PEER_EVENT_ENDPOINT_APPLICATION_CHANGED event. Locally, applications receive the PEER_EVENT_MY_APPLICATION_CHANGED event. 
 * 
 * The <b>current user</b> scope has priority over the <b>all user</b> scope. If the application is registered in both scopes, the event will be fired only if the <b>current user</b> scope is changed.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_application_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_APPLICATION_CHANGED_DATA {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the peer contact information for a contact whose change in application  raised the event.
     * @deprecated
     */
    pContact : PEER_CONTACT.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint information for a contact whose change in application information raised the event.
     * @deprecated
     */
    pEndpoint : PEER_ENDPOINT.Ptr

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of application change that occurred.
     * @deprecated
     */
    changeType : PEER_CHANGE_TYPE

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application">PEER_APPLICATION</a> structure that contains the changed application information.
     * @deprecated
     */
    pApplication : PEER_APPLICATION.Ptr

}
