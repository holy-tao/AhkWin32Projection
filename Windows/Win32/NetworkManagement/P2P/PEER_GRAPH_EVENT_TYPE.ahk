#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_GRAPH_EVENT_TYPE enumeration specifies peer event types the application is to be notified for.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_graph_event_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_EVENT_TYPE{

    /**
     * The peer graph   status has changed in some manner. For example, the node has synchronized with the peer graph.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_STATUS_CHANGED => 1

    /**
     * A field in the peer graph property structure has changed. This peer event does not generate  a specific piece of data for an application to retrieve. The application must use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetproperties">PeerGraphGetProperties</a> to obtain the updated structure.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_PROPERTY_CHANGED => 2

    /**
     * A record type or specific record has changed in some manner.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_RECORD_CHANGED => 3

    /**
     * A peer's direct connection has changed.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_DIRECT_CONNECTION => 4

    /**
     * A connection to a peer neighbor has changed.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_NEIGHBOR_CONNECTION => 5

    /**
     * Data has been received from a direct or neighbor connection.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_INCOMING_DATA => 6

    /**
     * The peer graph has become unstable.  The client should call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphconnect">PeerGraphConnect</a> on a new node. This peer event does not generate  a specific piece of data for an application to retrieve.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_CONNECTION_REQUIRED => 7

    /**
     * A node's presence status has changed in the peer graph.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_NODE_CHANGED => 8

    /**
     * A specific  record type has been synchronized.
     * @type {Integer (Int32)}
     */
    static PEER_GRAPH_EVENT_SYNCHRONIZED => 9
}
