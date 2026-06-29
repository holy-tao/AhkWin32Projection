#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_INVITATION_RESPONSE_TYPE.ahk" { PEER_INVITATION_RESPONSE_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The PEER_INVITATION_RESPONSE structure contains a response to an invitation to join a peer collaboration activity.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_invitation_response
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_INVITATION_RESPONSE {
    #StructPack 8

    /**
     * [PEER_INVITATION_RESPONSE_TYPE](./ne-p2p-peer_invitation_response_type.md) enumeration value that specifies the action the peer takes in response to the invitation.
     * @deprecated
     */
    action : PEER_INVITATION_RESPONSE_TYPE

    /**
     * Reserved. This member must be set to <b>NULL</b>, and is set exclusively by the Peer Collaboration infrastructure.
     */
    pwzMessage : PWSTR

    /**
     * Any extended information that is part of the response. This can include an error code corresponding to the failure on the recipient of the invitation.
     */
    hrExtendedInfo : HRESULT

}
