#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_PRESENCE_INFO.ahk
#Include .\PEER_ENDPOINT.ahk
#Include .\PEER_CONTACT.ahk
#Include .\PEER_CHANGE_TYPE.ahk

/**
 * The PEER_EVENT_PRESENCE_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_PRESENCE_CHANGED or PEER_EVENT_MY_PRESENCE_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_presence_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_EVENT_PRESENCE_CHANGED_DATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the peer contact information for the contact whose change in presence raised the event.
     * @deprecated
     * @type {Pointer<PEER_CONTACT>}
     */
    pContact {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint information for the contact whose change in presence raised the event.
     * @deprecated
     * @type {Pointer<PEER_ENDPOINT>}
     */
    pEndpoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_change_type">PEER_CHANGE_TYPE</a> enumeration value that specifies the type of presence change that occurred.
     * @deprecated
     * @type {PEER_CHANGE_TYPE}
     */
    changeType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_presence_info">PEER_PRESENCE_INFO</a> structure that contains the updated presence information for the endpoint of the contact whose change in presence raised the event.
     * @deprecated
     * @type {Pointer<PEER_PRESENCE_INFO>}
     */
    pPresenceInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
