#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_IF_CONNECTION_TYPE enumeration type specifies the NDIS network interface connection type.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-net_if_connection_type
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NET_IF_CONNECTION_TYPE extends Win32Enum {

    /**
     * Specifies the dedicated connection type. The connection comes up automatically when media sense is
     *      <b>TRUE</b>. For example, an Ethernet connection is dedicated.
     * Native name: NET_IF_CONNECTION_DEDICATED
     * @type {Integer (Int32)}
     */
    static DEDICATED => 1

    /**
     * Specifies the passive connection type. The other end must bring up the connection to the local
     *      station. For example, the RAS interface is passive.
     * Native name: NET_IF_CONNECTION_PASSIVE
     * @type {Integer (Int32)}
     */
    static PASSIVE => 2

    /**
     * Specifies the demand-dial connection type. A demand-dial connection comes up in response to a
     *      local action--for example, sending a packet.
     * Native name: NET_IF_CONNECTION_DEMAND
     * @type {Integer (Int32)}
     */
    static DEMAND => 3

    /**
     * A maximum value for testing purposes.
     * Native name: NET_IF_CONNECTION_MAXIMUM
     * @type {Integer (Int32)}
     */
    static MAXIMUM => 4
}
