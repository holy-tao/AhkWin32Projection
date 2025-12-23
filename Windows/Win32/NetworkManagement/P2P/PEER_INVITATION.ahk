#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * The PEER_INVITATION structure contains a request to initiate or join a peer collaboration activity.
 * @remarks
 * An invitation request is typically sent by a peer after a contact appears online within the peer collaboration network and a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumapplications">PeerCollabEnumApplications</a> returns a common software application (represented as a application GUID) available on the contact's endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_invitation
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_INVITATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID value that uniquely identifies the registered software or software component for the peer collaboration activity.
     * @type {Pointer<Guid>}
     */
    applicationId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains opaque data describing possible additional application-specific settings (for example, an address and port on which the activity will occur, or a specific video codec to use). This data is limited to 16K.
     * @deprecated 
     * @type {PEER_DATA}
     */
    applicationData{
        get {
            if(!this.HasProp("__applicationData"))
                this.__applicationData := PEER_DATA(8, this)
            return this.__applicationData
        }
    }

    /**
     * Zero-terminated Unicode string that contains a specific request message to the invitation recipient. The message is limited to 255 unicode characters.
     * @type {PWSTR}
     */
    pwzMessage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
