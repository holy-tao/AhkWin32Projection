#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UEastAsianWidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_NEUTRAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_AMBIGUOUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_HALFWIDTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_FULLWIDTH => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_NARROW => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_WIDE => 5
}
