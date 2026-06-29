#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_INVITATION structure contains a request to initiate or join a peer collaboration activity.
 * @remarks
 * An invitation request is typically sent by a peer after a contact appears online within the peer collaboration network and a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumapplications">PeerCollabEnumApplications</a> returns a common software application (represented as a application GUID) available on the contact's endpoint.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_invitation
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_INVITATION {
    #StructPack 8

    /**
     * GUID value that uniquely identifies the registered software or software component for the peer collaboration activity.
     */
    applicationId : Guid

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains opaque data describing possible additional application-specific settings (for example, an address and port on which the activity will occur, or a specific video codec to use). This data is limited to 16K.
     * @deprecated
     */
    applicationData : PEER_DATA

    /**
     * Zero-terminated Unicode string that contains a specific request message to the invitation recipient. The message is limited to 255 unicode characters.
     */
    pwzMessage : PWSTR

}
