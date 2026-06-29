#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_KEY_DIRECTION {
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
    static dot11_key_direction_both => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_key_direction_inbound => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_key_direction_outbound => 3
}
