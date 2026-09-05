#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify hints about the usage charge for a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_network_connectivity_cost_hint
 * @namespace Windows.Win32.Networking.WinSock
 */
class NL_NETWORK_CONNECTIVITY_COST_HINT extends Win32Enum {

    /**
     * Specifies a hint that cost information is not available.
     * Native name: NetworkConnectivityCostHintUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies a hint that the connection is unlimited, and has unrestricted usage charges and capacity constraints.
     * Native name: NetworkConnectivityCostHintUnrestricted
     * @type {Integer (Int32)}
     */
    static Unrestricted => 1

    /**
     * Specifies a hint that the use of the connection is unrestricted up to a specific limit.
     * Native name: NetworkConnectivityCostHintFixed
     * @type {Integer (Int32)}
     */
    static Fixed => 2

    /**
     * Specifies a hint that the connection is charged on a per-byte basis.
     * Native name: NetworkConnectivityCostHintVariable
     * @type {Integer (Int32)}
     */
    static Variable => 3
}
