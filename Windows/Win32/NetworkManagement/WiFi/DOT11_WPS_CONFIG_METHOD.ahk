#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_WPS_CONFIG_METHOD extends Win32Enum {

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 0

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_DISPLAY
     * @type {Integer (Int32)}
     */
    static DISPLAY => 8

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_NFC_TAG
     * @type {Integer (Int32)}
     */
    static NFC_TAG => 32

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_NFC_INTERFACE
     * @type {Integer (Int32)}
     */
    static NFC_INTERFACE => 64

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_PUSHBUTTON
     * @type {Integer (Int32)}
     */
    static PUSHBUTTON => 128

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_KEYPAD
     * @type {Integer (Int32)}
     */
    static KEYPAD => 256

    /**
     * Native name: DOT11_WPS_CONFIG_METHOD_WFDS_DEFAULT
     * @type {Integer (Int32)}
     */
    static WFDS_DEFAULT => 4096
}
