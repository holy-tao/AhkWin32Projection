#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_EVENT_NODE_CHANGE_DATA structure contains a pointer to the data if a PEER_GRAPH_EVENT_NODE_CHANGE event is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_node_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_NODE_CHANGE_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size of the structure. Should  set to the size of PEER_EVENT_NODE_CHANGE_DATA.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the  new  state of the node. Valid values are the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_NODE_CHANGE_CONNECTED"></a><a id="peer_node_change_connected"></a><dl>
     * <dt><b>PEER_NODE_CHANGE_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is present in the graph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_NODE_CHANGE_DISCONNECTED"></a><a id="peer_node_change_disconnected"></a><dl>
     * <dt><b>PEER_NODE_CHANGE_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is no longer present in the graph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_NODE_CHANGE_UPDATED"></a><a id="peer_node_change_updated"></a><dl>
     * <dt><b>PEER_NODE_CHANGE_UPDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node has new information, for example, the attributes have changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @deprecated
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the  unique ID of the node that has changed.
     * @type {Integer}
     */
    ullNodeId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the peer ID of the node that has  changed.
     * @type {Pointer<Char>}
     */
    pwzPeerId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
