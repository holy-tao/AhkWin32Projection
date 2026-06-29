#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_GRAPH_PROPERTY_FLAGS enumeration specifies properties of a peer graph.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_property_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GRAPH_PROPERTY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
