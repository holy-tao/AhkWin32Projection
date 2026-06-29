#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BAND {
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
    static dot11_band_2p4g => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_band_4p9g => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_band_5g => 3
}
