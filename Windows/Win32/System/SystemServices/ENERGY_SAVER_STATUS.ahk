#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ENERGY_SAVER_STATUS extends Win32Enum {

    /**
     * Native name: ENERGY_SAVER_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: ENERGY_SAVER_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 1

    /**
     * Native name: ENERGY_SAVER_HIGH_SAVINGS
     * @type {Integer (Int32)}
     */
    static HIGH_SAVINGS => 2
}
