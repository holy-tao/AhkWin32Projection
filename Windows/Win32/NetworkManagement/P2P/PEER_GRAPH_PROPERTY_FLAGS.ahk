#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GRAPH_PROPERTY_FLAGS enumeration specifies properties of a peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_property_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_PROPERTY_FLAGS extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_PROPERTY_HEARTBEATS => 1

    /**
     * Graph records are not expired until the peer  connects with a graph.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_PROPERTY_DEFER_EXPIRATION => 2
}
