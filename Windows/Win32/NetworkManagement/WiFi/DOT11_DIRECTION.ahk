#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_DIRECTION extends Win32Enum {

    /**
     * Native name: DOT11_DIR_INBOUND
     * @type {Integer (Int32)}
     */
    static DIR_INBOUND => 1

    /**
     * Native name: DOT11_DIR_OUTBOUND
     * @type {Integer (Int32)}
     */
    static DIR_OUTBOUND => 2

    /**
     * Native name: DOT11_DIR_BOTH
     * @type {Integer (Int32)}
     */
    static DIR_BOTH => 3
}
