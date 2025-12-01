#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GRAPH_SCOPE enumeration specifies the network scope of a peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_scope
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_SCOPE extends Win32Enum{

    /**
     * The peer graph's network scope can contain any IP address, valid or otherwise.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_SCOPE_ANY => 0

    /**
     * The IP addresses for the peer graph's network scope can be from any unblocked address range.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_SCOPE_GLOBAL => 1

    /**
     * The IP addresses for the peer graph's network scope must be within the IP range defined for the site.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_SCOPE_SITELOCAL => 2

    /**
     * The IP addresses for the peer graph's network scope must be within the IP range defined for the local area network.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_SCOPE_LINKLOCAL => 3

    /**
     * The peer graph's network scope is the local computer's loopback IP address.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_SCOPE_LOOPBACK => 4
}
