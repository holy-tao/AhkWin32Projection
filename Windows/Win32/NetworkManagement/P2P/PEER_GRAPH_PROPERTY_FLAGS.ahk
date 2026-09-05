#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GRAPH_PROPERTY_FLAGS enumeration specifies properties of a peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_property_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_GRAPH_PROPERTY_FLAGS extends Win32Enum {

    /**
     * Reserved.
     * Native name: PEER_GRAPH_PROPERTY_HEARTBEATS
     * @type {Integer (Int32)}
     */
    static HEARTBEATS => 1

    /**
     * Graph records are not expired until the peer  connects with a graph.
     * Native name: PEER_GRAPH_PROPERTY_DEFER_EXPIRATION
     * @type {Integer (Int32)}
     */
    static DEFER_EXPIRATION => 2
}
