#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_NETWORK_INFRASTRUCTURE {
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
    static Ndis802_11IBSS => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Infrastructure => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11AutoUnknown => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11InfrastructureMax => 3
}
