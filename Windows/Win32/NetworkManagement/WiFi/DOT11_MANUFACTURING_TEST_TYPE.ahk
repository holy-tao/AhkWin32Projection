#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MANUFACTURING_TEST_TYPE {
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
    static dot11_manufacturing_test_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_self_start => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_self_query_result => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_rx => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_tx => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_query_adc => 5

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_set_data => 6

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_query_data => 7

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_sleep => 8

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_awake => 9

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_IHV_start => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static dot11_manufacturing_test_IHV_end => -1
}
