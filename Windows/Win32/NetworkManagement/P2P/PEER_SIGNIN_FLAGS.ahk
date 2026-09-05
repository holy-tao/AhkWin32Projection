#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_SIGNIN_FLAGS enumeration defines the set of peer presence publication behaviors available when the peer signs in to a peer collaboration network.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_signin_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_SIGNIN_FLAGS extends Win32Enum {

    /**
     * A peer's presence is not being published in any scope.
     * Native name: PEER_SIGNIN_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The peer can publish availability information to endpoints in the same subnet or local area network, or query for other endpoints available on the subnet.
     * Native name: PEER_SIGNIN_NEAR_ME
     * @type {Integer (Int32)}
     */
    static NEAR_ME => 1

    /**
     * The peer can publish presence, applications, and objects to all contacts in a peer's contact list.
     * Native name: PEER_SIGNIN_INTERNET
     * @type {Integer (Int32)}
     */
    static INTERNET => 2

    /**
     * The peer can publish presence, applications, and objects to all contacts in a peer's contact list, or query for other endpoints available on the subnet.
     * Native name: PEER_SIGNIN_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 3
}
