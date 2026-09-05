#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_MSONEX_RESULT extends Win32Enum {

    /**
     * Native name: DOT11_MSONEX_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Native name: DOT11_MSONEX_FAILURE
     * @type {Integer (Int32)}
     */
    static FAILURE => 1

    /**
     * Native name: DOT11_MSONEX_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 2
}
