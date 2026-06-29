#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_COLLAB_EVENT_TYPE.ahk" { PEER_COLLAB_EVENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_COLLAB_EVENT_REGISTRATION structure contains the data used by a peer to register for specific peer collaboration network events.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_collab_event_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_COLLAB_EVENT_REGISTRATION {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_collab_event_type">PEER_COLLAB_EVENT_TYPE</a> enumeration value that specifies the type of peer collaboration network event for which to register.
     * @deprecated
     */
    eventType : PEER_COLLAB_EVENT_TYPE

    /**
     * GUID value that uniquely identifies the application or object  that registers for the specific event.
     * 
     * This parameter is valid only for PEER_EVENT_ENDPOINT_APPLICATION_CHANGED, PEER_EVENT_ENDPOINT_OBJECT_CHANGED, PEER_EVENT_MY_APPLICATION_CHANGED, and PEER_EVENT_MY_OBJECT_CHANGED. This GUID represents the application ID for application-specific events, and the object ID for object-specific events.  
     * 
     * When this member is set, notification will be sent only for the specific application or object.
     */
    pInstance : Guid.Ptr

}
