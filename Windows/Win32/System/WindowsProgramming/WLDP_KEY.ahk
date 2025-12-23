#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_KEY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KEY_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static KEY_OVERRIDE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KEY_ALL_KEYS => 2
}
