#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DS_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DS_CHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DS_UNCHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DS_UNKNOWN => 2
}
