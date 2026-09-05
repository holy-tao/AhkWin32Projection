#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class WLDP_SECURE_SETTING_VALUE_TYPE extends Win32Enum {

    /**
     * Native name: WLDP_SECURE_SETTING_VALUE_TYPE_BOOLEAN
     * @type {Integer (Int32)}
     */
    static BOOLEAN => 0

    /**
     * Native name: WLDP_SECURE_SETTING_VALUE_TYPE_ULONG
     * @type {Integer (Int32)}
     */
    static ULONG => 1

    /**
     * Native name: WLDP_SECURE_SETTING_VALUE_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static BINARY => 2

    /**
     * Native name: WLDP_SECURE_SETTING_VALUE_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 3
}
