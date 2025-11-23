#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_INVITATION_RESPONSE structure contains a response to an invitation to join a peer collaboration activity.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_invitation_response
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_INVITATION_RESPONSE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * [PEER_INVITATION_RESPONSE_TYPE](./ne-p2p-peer_invitation_response_type.md) enumeration value that specifies the action the peer takes in response to the invitation.
     * @deprecated 
     * @type {Integer}
     */
    action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved. This member must be set to <b>NULL</b>, and is set exclusively by the Peer Collaboration infrastructure.
     * @type {PWSTR}
     */
    pwzMessage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Any extended information that is part of the response. This can include an error code corresponding to the failure on the recipient of the invitation.
     * @type {HRESULT}
     */
    hrExtendedInfo {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
