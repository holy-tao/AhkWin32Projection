#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_NETWORK_TYPE {
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
    static Ndis802_11FH => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11DS => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11OFDM5 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11OFDM24 => 3

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11Automode => 4

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11NetworkTypeMax => 5
}
