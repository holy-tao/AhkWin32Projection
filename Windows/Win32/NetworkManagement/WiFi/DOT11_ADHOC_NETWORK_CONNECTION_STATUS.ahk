#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the connection state of an ad hoc network.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ADHOC_NETWORK_CONNECTION_STATUS{

    /**
     * The connection status cannot be determined. A network with this status should not be used.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_NETWORK_CONNECTION_STATUS_INVALID => 0

    /**
     * There are no hosts or clients connected to the network. There are also no pending connection requests for this network.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_NETWORK_CONNECTION_STATUS_DISCONNECTED => 11

    /**
     * There is an outstanding connection request. Once the client or host succeeds or fails in its connection attempt, the connection status is updated.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_NETWORK_CONNECTION_STATUS_CONNECTING => 12

    /**
     * A client or host is connected to the network.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_NETWORK_CONNECTION_STATUS_CONNECTED => 13

    /**
     * The network has been formed. Once a client or host connects to the network, the connection status is updated.
     * @type {Integer (Int32)}
     */
    static DOT11_ADHOC_NETWORK_CONNECTION_STATUS_FORMED => 14
}
