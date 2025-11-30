#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class ENERGY_SAVER_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ENERGY_SAVER_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static ENERGY_SAVER_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENERGY_SAVER_HIGH_SAVINGS => 2
}
