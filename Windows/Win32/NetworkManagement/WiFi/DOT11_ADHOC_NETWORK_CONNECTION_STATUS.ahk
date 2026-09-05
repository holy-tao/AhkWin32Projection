#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the connection state of an ad hoc network.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_ADHOC_NETWORK_CONNECTION_STATUS extends Win32Enum {

    /**
     * The connection status cannot be determined. A network with this status should not be used.
     * Native name: DOT11_ADHOC_NETWORK_CONNECTION_STATUS_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * There are no hosts or clients connected to the network. There are also no pending connection requests for this network.
     * Native name: DOT11_ADHOC_NETWORK_CONNECTION_STATUS_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 11

    /**
     * There is an outstanding connection request. Once the client or host succeeds or fails in its connection attempt, the connection status is updated.
     * Native name: DOT11_ADHOC_NETWORK_CONNECTION_STATUS_CONNECTING
     * @type {Integer (Int32)}
     */
    static CONNECTING => 12

    /**
     * A client or host is connected to the network.
     * Native name: DOT11_ADHOC_NETWORK_CONNECTION_STATUS_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 13

    /**
     * The network has been formed. Once a client or host connects to the network, the connection status is updated.
     * Native name: DOT11_ADHOC_NETWORK_CONNECTION_STATUS_FORMED
     * @type {Integer (Int32)}
     */
    static FORMED => 14
}
