#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

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
 */
export default struct PEER_NAME_PAIR {
    #StructPack 8

    /**
     * Specifies the size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * Specifies the peer name of the peer identity or peer group.
     */
    pwzPeerName : PWSTR

    /**
     * Specifies the friendly name of the peer identity or peer group.
     */
    pwzFriendlyName : PWSTR

}
