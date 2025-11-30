#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MSONEX_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_MSONEX_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_MSONEX_FAILURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_MSONEX_IN_PROGRESS => 2
}
