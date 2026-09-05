#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_NETWORK_CHANGE_TYPE extends Win32Enum {

    /**
     * Native name: NdisPossibleNetworkChange
     * @type {Integer (Int32)}
     */
    static PossibleNetworkChange => 1

    /**
     * Native name: NdisDefinitelyNetworkChange
     * @type {Integer (Int32)}
     */
    static DefinitelyNetworkChange => 2

    /**
     * Native name: NdisNetworkChangeFromMediaConnect
     * @type {Integer (Int32)}
     */
    static FromMediaConnect => 3

    /**
     * Native name: NdisNetworkChangeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
