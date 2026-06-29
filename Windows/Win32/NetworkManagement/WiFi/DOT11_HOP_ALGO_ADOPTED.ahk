#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_HOP_ALGO_ADOPTED {
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
    static dot11_hop_algo_current => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_hop_algo_hop_index => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_hop_algo_hcc => 2
}
