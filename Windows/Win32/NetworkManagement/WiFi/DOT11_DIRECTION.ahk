#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DIRECTION {
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
    static DOT11_DIR_INBOUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DIR_OUTBOUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DIR_BOTH => 3
}
