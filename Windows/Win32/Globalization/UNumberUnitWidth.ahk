#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumberUnitWidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_NARROW => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_SHORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_FULL_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_ISO_CODE => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_FORMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_VARIANT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_HIDDEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_COUNT => 7
}
