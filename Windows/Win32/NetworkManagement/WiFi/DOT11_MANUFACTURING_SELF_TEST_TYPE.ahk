#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_MANUFACTURING_SELF_TEST_TYPE extends Win32Enum {

    /**
     * Native name: DOT11_MANUFACTURING_SELF_TEST_TYPE_INTERFACE
     * @type {Integer (Int32)}
     */
    static INTERFACE => 1

    /**
     * Native name: DOT11_MANUFACTURING_SELF_TEST_TYPE_RF_INTERFACE
     * @type {Integer (Int32)}
     */
    static RF_INTERFACE => 2

    /**
     * Native name: DOT11_MANUFACTURING_SELF_TEST_TYPE_BT_COEXISTENCE
     * @type {Integer (Int32)}
     */
    static BT_COEXISTENCE => 3
}
