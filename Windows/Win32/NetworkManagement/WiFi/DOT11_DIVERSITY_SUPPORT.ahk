#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DIVERSITY_SUPPORT {
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
    static dot11_diversity_support_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_fixedlist => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_notsupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_diversity_support_dynamic => 3
}
