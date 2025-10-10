#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NET_IF_OPER_STATUS enumeration type defines the current NDIS network interface operational status.
 * @see https://docs.microsoft.com/windows/win32/api//ifdef/ne-ifdef-net_if_oper_status
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_IF_OPER_STATUS{

    /**
     * Specifies that the interface is ready to transmit and receive all supported packet types.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_UP => 1

    /**
     * Specifies that the interface is not ready to transmit or receive data. For example, the media is
 *      disconnected or the port is not authenticated. In this state, it might be possible to transmit or
 *      receive some information. For example, if the interface is down because it has not been authenticated,
 *      802.1<i>x</i> authentication packets can be transmitted and received.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_DOWN => 2

    /**
     * Specifies that the interface is in a test mode and no operational packets can be transmitted or
 *      received.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_TESTING => 3

    /**
     * Specifies that the operational status of the network interface cannot be determined.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_UNKNOWN => 4

    /**
     * Specifies that the network interface cannot send or receive packets because the interface is
 *      waiting for an external event.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_DORMANT => 5

    /**
     * Specifies that the network interface is not ready to transmit or receive data because a component
 *      is missing in the managed system. This state is more specific than, but similar to, the
 *      <b>NET_IF_OPER_STATUS_DOWN</b> state.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_NOT_PRESENT => 6

    /**
     * Specifies that the network interface is not ready to transmit or receive data because underlying
 *      interfaces are down. This state is more specific than, but similar to, the NET_IF_OPER_STATUS_DOWN
 *      state.
     * @type {Integer (Int32)}
     */
    static NET_IF_OPER_STATUS_LOWER_LAYER_DOWN => 7
}
