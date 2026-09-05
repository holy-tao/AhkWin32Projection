#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UEastAsianWidth extends Win32Enum {

    /**
     * Native name: U_EA_NEUTRAL
     * @type {Integer (Int32)}
     */
    static EA_NEUTRAL => 0

    /**
     * Native name: U_EA_AMBIGUOUS
     * @type {Integer (Int32)}
     */
    static EA_AMBIGUOUS => 1

    /**
     * Native name: U_EA_HALFWIDTH
     * @type {Integer (Int32)}
     */
    static EA_HALFWIDTH => 2

    /**
     * Native name: U_EA_FULLWIDTH
     * @type {Integer (Int32)}
     */
    static EA_FULLWIDTH => 3

    /**
     * Native name: U_EA_NARROW
     * @type {Integer (Int32)}
     */
    static EA_NARROW => 4

    /**
     * Native name: U_EA_WIDE
     * @type {Integer (Int32)}
     */
    static EA_WIDE => 5
}
