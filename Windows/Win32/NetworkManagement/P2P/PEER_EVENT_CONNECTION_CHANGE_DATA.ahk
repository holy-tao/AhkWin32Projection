#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Points to the PEER_EVENT_CONNECTION_CHANGE_DATA structure if one of the following peer events is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_connection_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_CONNECTION_CHANGE_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size of a structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of change in a neighbor or direct connection. Valid values are the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_CONNECTED"></a><a id="peer_connected"></a><dl>
     * <dt><b><b>PEER_CONNECTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A new incoming or outgoing connection to the local node has been established.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_CONNECTION_FAILED"></a><a id="peer_connection_failed"></a><dl>
     * <dt><b><b>PEER_CONNECTION_FAILED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to connect to a local node has failed. 
     * 
     * It is possible for a single attempt to connect to result in multiple connection failures. This will occur after the initial connection failure, when the peer infrastructure sets the <b>ullNextConnectionId</b> member to the Node ID and attempts a new connection.  If the <b>ullNextConnectionId</b> member is 0, no further connections will be attempted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_DISCONNECTED"></a><a id="peer_disconnected"></a><dl>
     * <dt><b><b>PEER_DISCONNECTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An existing connection has been disconnected.
     * 
     * </td>
     * </tr>
     * </table>
     * @deprecated
     * @type {Integer}
     */
    status {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the unique ID for a connection that has changed.
     * @type {Integer}
     */
    ullConnectionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the unique ID for the node that has changed.
     * @type {Integer}
     */
    ullNodeId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>Windows Vista or later.</b> Contains the next available node ID that the grouping or graphing APIs will attempt to connect to when a connection fails. If this member has a value of 0, no further connections will be attempted.
     * @type {Integer}
     */
    ullNextConnectionId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * <b>Windows Vista or later.</b> Specifies the type of error when a connection fails.  <b>hrConnectionFailedReason</b> can return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>PEER_E_CONNECTION_REFUSED</b></td>
     * <td>A connection has been established and refused. The remote node is already at  maximum number of connections or a connection already exists.</td>
     * </tr>
     * <tr>
     * <td><b>PEER_E_CONNECTION_FAILED</b></td>
     * <td>An attempt to connect to a remote node has failed.</td>
     * </tr>
     * <tr>
     * <td><b>PEER_E_CONNECTION_NOT_AUTHENTICATED </b></td>
     * <td>A connection is lost during the authentication phase. This is the result of a network failure or the  remote node breaking the connection.</td>
     * </tr>
     * </table>
     * @type {HRESULT}
     */
    hrConnectionFailedReason {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
