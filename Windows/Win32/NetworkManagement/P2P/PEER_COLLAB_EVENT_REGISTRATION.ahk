#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_COLLAB_EVENT_REGISTRATION structure contains the data used by a peer to register for specific peer collaboration network events.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_collab_event_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_COLLAB_EVENT_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_collab_event_type">PEER_COLLAB_EVENT_TYPE</a> enumeration value that specifies the type of peer collaboration network event for which to register.
     * @deprecated 
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * GUID value that uniquely identifies the application or object  that registers for the specific event.
     * 
     * This parameter is valid only for PEER_EVENT_ENDPOINT_APPLICATION_CHANGED, PEER_EVENT_ENDPOINT_OBJECT_CHANGED, PEER_EVENT_MY_APPLICATION_CHANGED, and PEER_EVENT_MY_OBJECT_CHANGED. This GUID represents the application ID for application-specific events, and the object ID for object-specific events.  
     * 
     * When <b></b>this member is set, notification will be sent only for the specific application or object.
     * @type {Pointer<Guid>}
     */
    pInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
