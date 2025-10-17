#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * The PEER_CONTACT structure contains information about a specific contact.
 * @remarks
 * 
  * "Contacts" are peers participating in a peer collaboration network who publish presence information available to the local peer. This associated information enables the peer application to "watch" them for updates and peer application or object status changes. Lists of contacts are maintained by the peer collaboration infrastructure, and specific status change events are raised for each individual contact in the list.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_contact
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_CONTACT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Zero-terminated Unicode string that contains the peer name of the contact. This is the unique identifier for a contact.  There can only be a single contact associated with any given peername.
     * @type {PWSTR}
     */
    pwzPeerName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Zero-terminated Unicode string that contains the nickname of the contact and can be modified at any time. This is used when the peer collaboration scope is set to People Near Me. It is advertised in People Near Me and seen by recipients of sent invitations. 
     * 
     * This member is limited to 255 unicode characters.
     * @type {PWSTR}
     */
    pwzNickName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Zero-terminated Unicode string that contains the display name of the contact. This corresponds to the display name seen for the contact in a peer's contacts folder.
     * 
     * This member is limited to 255 unicode characters.
     * @type {PWSTR}
     */
    pwzDisplayName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Zero-terminated Unicode string that contains the email address of the contact.
     * @type {PWSTR}
     */
    pwzEmailAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * If true, the contact is watched by the peer; if false, it is not.
     * @type {BOOL}
     */
    fWatch {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_watch_permission">PEER_WATCH_PERMISSION</a> enumeration value that specifies the watch permissions for this contact.
     * @deprecated
     * @type {Integer}
     */
    WatcherPermissions {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_data">PEER_DATA</a> structure that contains the security credentials for the contact in an opaque byte buffer.
     * @deprecated
     * @type {PEER_DATA}
     */
    credentials{
        get {
            if(!this.HasProp("__credentials"))
                this.__credentials := PEER_DATA(40, this)
            return this.__credentials
        }
    }
}
