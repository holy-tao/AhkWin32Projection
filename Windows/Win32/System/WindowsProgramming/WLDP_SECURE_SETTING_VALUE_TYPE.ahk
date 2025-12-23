#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_SECURE_SETTING_VALUE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_BOOLEAN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_ULONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_BINARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_SECURE_SETTING_VALUE_TYPE_STRING => 3
}
