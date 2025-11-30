#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class URegionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static URGN_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static URGN_TERRITORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static URGN_WORLD => 2

    /**
     * @type {Integer (Int32)}
     */
    static URGN_CONTINENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static URGN_SUBCONTINENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static URGN_GROUPING => 5

    /**
     * @type {Integer (Int32)}
     */
    static URGN_DEPRECATED => 6
}
