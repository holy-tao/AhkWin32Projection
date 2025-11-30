#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_NODE_CHANGE_TYPE enumeration specifies the types of peer node graph status changes.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_node_change_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_NODE_CHANGE_TYPE extends Win32Enum{

    /**
     * The peer node has connected to the graph.
     * @type {Integer (Int32)}
     */
    static PEER_NODE_CHANGE_CONNECTED => 1

    /**
     * The peer node has disconnected from the graph.
     * @type {Integer (Int32)}
     */
    static PEER_NODE_CHANGE_DISCONNECTED => 2

    /**
     * The peer node's status within the graph has changed.
     * @type {Integer (Int32)}
     */
    static PEER_NODE_CHANGE_UPDATED => 3
}
