#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of scopes for the publication of peer objects or data.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_publication_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_PUBLICATION_SCOPE extends Win32Enum {

    /**
     * No scope is set for the publication of this data.
     * Native name: PEER_PUBLICATION_SCOPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The data is published to peers in the same logical or virtual subnet.
     * Native name: PEER_PUBLICATION_SCOPE_NEAR_ME
     * @type {Integer (Int32)}
     */
    static NEAR_ME => 1

    /**
     * The data is published to peers on the Internet.
     * Native name: PEER_PUBLICATION_SCOPE_INTERNET
     * @type {Integer (Int32)}
     */
    static INTERNET => 2

    /**
     * The data is published to all peers.
     * Native name: PEER_PUBLICATION_SCOPE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 3
}
