#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_CALLBACK_TYPE {
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
    static dot11_manufacturing_callback_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_callback_self_test_complete => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_callback_sleep_complete => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_callback_IHV_start => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_callback_IHV_end => -1
}
