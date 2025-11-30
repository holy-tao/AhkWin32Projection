#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DIR_INBOUND => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DIR_OUTBOUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_DIR_BOTH => 3
}
