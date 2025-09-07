#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_GRAPH_STATUS_FLAGS enumeration is a set of flags that show the current status of a node within the peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_status_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_STATUS_FLAGS{

    /**
     * Specifies whether or not the node is listening for connections.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_STATUS_LISTENING => 1

    /**
     * Specifies whether or not the node has connections to other nodes.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_STATUS_HAS_CONNECTIONS => 2

    /**
     * Specifies whether or not the node's database is synchronized.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_STATUS_SYNCHRONIZED => 4
}
