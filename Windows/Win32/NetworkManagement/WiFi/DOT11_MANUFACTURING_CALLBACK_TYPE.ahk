#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_CALLBACK_TYPE{

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
