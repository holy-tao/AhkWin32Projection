#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_DS_INFO extends Win32Enum {

    /**
     * Native name: DOT11_DS_CHANGED
     * @type {Integer (Int32)}
     */
    static CHANGED => 0

    /**
     * Native name: DOT11_DS_UNCHANGED
     * @type {Integer (Int32)}
     */
    static UNCHANGED => 1

    /**
     * Native name: DOT11_DS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 2
}
