#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_NETWORK_CHANGE_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static NdisPossibleNetworkChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisDefinitelyNetworkChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisNetworkChangeFromMediaConnect => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisNetworkChangeMax => 4
}
