#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of scopes for the publication of peer objects or data.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_publication_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_PUBLICATION_SCOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No scope is set for the publication of this data.
     * @type {Integer (Int32)}
     */
    static PEER_PUBLICATION_SCOPE_NONE => 0

    /**
     * The data is published to peers in the same logical or virtual subnet.
     * @type {Integer (Int32)}
     */
    static PEER_PUBLICATION_SCOPE_NEAR_ME => 1

    /**
     * The data is published to peers on the Internet.
     * @type {Integer (Int32)}
     */
    static PEER_PUBLICATION_SCOPE_INTERNET => 2

    /**
     * The data is published to all peers.
     * @type {Integer (Int32)}
     */
    static PEER_PUBLICATION_SCOPE_ALL => 3
}
