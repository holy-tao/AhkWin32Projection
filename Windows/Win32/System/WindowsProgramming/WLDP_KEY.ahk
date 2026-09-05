#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class WLDP_KEY extends Win32Enum {

    /**
     * Native name: KEY_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: KEY_OVERRIDE
     * @type {Integer (Int32)}
     */
    static OVERRIDE => 1

    /**
     * Native name: KEY_ALL_KEYS
     * @type {Integer (Int32)}
     */
    static ALL_KEYS => 2
}
