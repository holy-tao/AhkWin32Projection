#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_NETWORK_CHANGE_TYPE extends Win32Enum{

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
