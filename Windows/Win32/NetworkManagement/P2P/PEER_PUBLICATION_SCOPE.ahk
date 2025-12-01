#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of scopes for the publication of peer objects or data.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_publication_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PUBLICATION_SCOPE extends Win32Enum{

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
