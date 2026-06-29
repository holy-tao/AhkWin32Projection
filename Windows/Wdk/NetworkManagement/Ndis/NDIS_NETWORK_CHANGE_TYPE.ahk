#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_NETWORK_CHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
