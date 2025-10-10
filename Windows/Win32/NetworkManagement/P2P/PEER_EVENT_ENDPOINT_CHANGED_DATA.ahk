#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_EVENT_ENDPOINT_CHANGED_DATA structure contains information returned when a PEER_EVENT_ENDPOINT_CHANGED or PEER_EVENT_MY_ENDPOINT_CHANGED event is raised on a peer participating in a peer collaboration network.
 * @remarks
 * 
  * This event is raised when information about the endpoint changes. An example of this being the endpoint name in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure is changed using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsetendpointname">PeerCollabSetEndpointName</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_event_endpoint_changed_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_ENDPOINT_CHANGED_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the contact information for the contact who changed endpoints.
     * @deprecated
     * @type {Pointer<PEER_CONTACT>}
     */
    pContact {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the new active endpoint for  the peer specified in <i>pContact</i>.
     * @deprecated
     * @type {Pointer<PEER_ENDPOINT>}
     */
    pEndpoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
