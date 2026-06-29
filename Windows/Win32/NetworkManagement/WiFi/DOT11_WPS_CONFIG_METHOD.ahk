#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WPS_CONFIG_METHOD {
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
    static DOT11_WPS_CONFIG_METHOD_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_DISPLAY => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_NFC_TAG => 32

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_NFC_INTERFACE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_PUSHBUTTON => 128

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_KEYPAD => 256

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_CONFIG_METHOD_WFDS_DEFAULT => 4096
}
