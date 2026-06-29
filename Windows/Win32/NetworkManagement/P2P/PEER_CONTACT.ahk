#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_WATCH_PERMISSION.ahk" { PEER_WATCH_PERMISSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The PEER_CONTACT structure contains information about a specific contact.
 * @remarks
 * "Contacts" are peers participating in a peer collaboration network who publish presence information available to the local peer. This associated information enables the peer application to "watch" them for updates and peer application or object status changes. Lists of contacts are maintained by the peer collaboration infrastructure, and specific status change events are raised for each individual contact in the list.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_contact
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CONTACT {
    #StructPack 8

    /**
     * Zero-terminated Unicode string that contains the peer name of the contact. This is the unique identifier for a contact.  There can only be a single contact associated with any given peername.
     */
    pwzPeerName : PWSTR

    /**
     * Zero-terminated Unicode string that contains the nickname of the contact and can be modified at any time. This is used when the peer collaboration scope is set to People Near Me. It is advertised in People Near Me and seen by recipients of sent invitations. 
     * 
     * This member is limited to 255 unicode characters.
     */
    pwzNickName : PWSTR

    /**
     * Zero-terminated Unicode string that contains the display name of the contact. This corresponds to the display name seen for the contact in a peer's contacts folder.
     * 
     * This member is limited to 255 unicode characters.
     */
    pwzDisplayName : PWSTR

    /**
     * Zero-terminated Unicode string that contains the email address of the contact.
     */
    pwzEmailAddress : PWSTR

    /**
     * If true, the contact is watched by the peer; if false, it is not.
     */
    fWatch : BOOL

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_watch_permission">PEER_WATCH_PERMISSION</a> enumeration value that specifies the watch permissions for this contact.
     * @deprecated
     */
    WatcherPermissions : PEER_WATCH_PERMISSION

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains the security credentials for the contact in an opaque byte buffer.
     * @deprecated
     */
    credentials : PEER_DATA

}
