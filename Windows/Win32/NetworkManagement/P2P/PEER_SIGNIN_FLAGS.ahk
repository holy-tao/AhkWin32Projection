#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_SIGNIN_FLAGS enumeration defines the set of peer presence publication behaviors available when the peer signs in to a peer collaboration network.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_signin_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_SIGNIN_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A peer's presence is not being published in any scope.
     * @type {Integer (Int32)}
     */
    static PEER_SIGNIN_NONE => 0

    /**
     * The peer can publish availability information to endpoints in the same subnet or local area network, or query for other endpoints available on the subnet.
     * @type {Integer (Int32)}
     */
    static PEER_SIGNIN_NEAR_ME => 1

    /**
     * The peer can publish presence, applications, and objects to all contacts in a peer's contact list.
     * @type {Integer (Int32)}
     */
    static PEER_SIGNIN_INTERNET => 2

    /**
     * The peer can publish presence, applications, and objects to all contacts in a peer's contact list, or query for other endpoints available on the subnet.
     * @type {Integer (Int32)}
     */
    static PEER_SIGNIN_ALL => 3
}
