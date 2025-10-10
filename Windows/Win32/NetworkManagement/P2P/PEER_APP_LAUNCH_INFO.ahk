#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_APP_LAUNCH_INFO structure contains the peer application application launch information provided by a contact in a previous peer invite request.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_app_launch_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_APP_LAUNCH_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains information about the contact that sent the request to the local peer to launch the application referenced by the application.
     * @deprecated
     * @type {Pointer<PEER_CONTACT>}
     */
    pContact {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the specific endpoint of the contact that sent the request to the local peer to launch the application referenced by the application
     * @deprecated
     * @type {Pointer<PEER_ENDPOINT>}
     */
    pEndpoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation to launch a specific peer application application on the local peer.
     * @deprecated
     * @type {Pointer<PEER_INVITATION>}
     */
    pInvitation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
