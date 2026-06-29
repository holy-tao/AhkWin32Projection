#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify hints about the usage charge for a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_network_connectivity_cost_hint
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_NETWORK_CONNECTIVITY_COST_HINT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
