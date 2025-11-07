#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify hints about the usage charge for a network connection.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ne-nldef-nl_network_connectivity_cost_hint
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_NETWORK_CONNECTIVITY_COST_HINT{

    /**
     * Specifies a hint that cost information is not available.
     * @type {Integer (Int32)}
     */
    static NetworkConnectivityCostHintUnknown => 0

    /**
     * Specifies a hint that the connection is unlimited, and has unrestricted usage charges and capacity constraints.
     * @type {Integer (Int32)}
     */
    static NetworkConnectivityCostHintUnrestricted => 1

    /**
     * Specifies a hint that the use of the connection is unrestricted up to a specific limit.
     * @type {Integer (Int32)}
     */
    static NetworkConnectivityCostHintFixed => 2

    /**
     * Specifies a hint that the connection is charged on a per-byte basis.
     * @type {Integer (Int32)}
     */
    static NetworkConnectivityCostHintVariable => 3
}
