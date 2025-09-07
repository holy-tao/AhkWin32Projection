#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_NAME_PAIR structure contains the results of a call to PeerGetNextItem.
 * @remarks
 * This structure is used when enumerating peer identities and peer groups associated with a specific identity.
  * 
  * When enumerating peer identities, each <b>PEER_NAME_PAIR</b> structure contains a peer name and the friendly name of the identity.
  * 
  * When enumerating peer groups,  each <b>PEER_NAME_PAIR</b>  structure contains the peer name and friendly name of the corresponding peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_name_pair
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_NAME_PAIR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the peer name of the peer identity or peer group.
     * @type {Pointer<Ptr>}
     */
    pwzPeerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the friendly name of the peer identity or peer group.
     * @type {Pointer<Ptr>}
     */
    pwzFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
