#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_SELF_TEST_TYPE {
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
    static DOT11_MANUFACTURING_SELF_TEST_TYPE_INTERFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_MANUFACTURING_SELF_TEST_TYPE_RF_INTERFACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_MANUFACTURING_SELF_TEST_TYPE_BT_COEXISTENCE => 3
}
