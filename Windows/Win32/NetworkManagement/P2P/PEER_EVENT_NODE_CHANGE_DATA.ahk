#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_NODE_CHANGE_TYPE.ahk" { PEER_NODE_CHANGE_TYPE }

/**
 * The PEER_EVENT_NODE_CHANGE_DATA structure contains a pointer to the data if a PEER_GRAPH_EVENT_NODE_CHANGE event is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_node_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_NODE_CHANGE_DATA {
    #StructPack 8

    /**
     * Specifies the size of the structure. Should  set to the size of PEER_EVENT_NODE_CHANGE_DATA.
     */
    dwSize : UInt32

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
     */
    changeType : PEER_NODE_CHANGE_TYPE

    /**
     * Specifies the  unique ID of the node that has changed.
     */
    ullNodeId : Int64

    /**
     * Specifies the peer ID of the node that has  changed.
     */
    pwzPeerId : PWSTR

}
