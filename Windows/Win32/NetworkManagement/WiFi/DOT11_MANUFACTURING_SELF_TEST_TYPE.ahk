#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_SELF_TEST_TYPE extends Win32Enum{

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
