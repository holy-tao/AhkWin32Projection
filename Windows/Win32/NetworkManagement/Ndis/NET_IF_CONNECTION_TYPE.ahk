#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NET_IF_CONNECTION_TYPE enumeration type specifies the NDIS network interface connection type.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-net_if_connection_type
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_IF_CONNECTION_TYPE{

    /**
     * Specifies the dedicated connection type. The connection comes up automatically when media sense is
 *      <b>TRUE</b>. For example, an Ethernet connection is dedicated.
     * @type {Integer (Int32)}
     */
    static NET_IF_CONNECTION_DEDICATED => 1

    /**
     * Specifies the passive connection type. The other end must bring up the connection to the local
 *      station. For example, the RAS interface is passive.
     * @type {Integer (Int32)}
     */
    static NET_IF_CONNECTION_PASSIVE => 2

    /**
     * Specifies the demand-dial connection type. A demand-dial connection comes up in response to a
 *      local action--for example, sending a packet.
     * @type {Integer (Int32)}
     */
    static NET_IF_CONNECTION_DEMAND => 3

    /**
     * A maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NET_IF_CONNECTION_MAXIMUM => 4
}
