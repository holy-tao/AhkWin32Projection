#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateFormatSymbolType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ERAS => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_MONTHS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT_MONTHS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_WEEKDAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT_WEEKDAYS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_AM_PMS => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_LOCALIZED_CHARS => 6

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ERA_NAMES => 7

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_NARROW_MONTHS => 8

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_NARROW_WEEKDAYS => 9

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_MONTHS => 10

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_SHORT_MONTHS => 11

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_NARROW_MONTHS => 12

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_WEEKDAYS => 13

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_SHORT_WEEKDAYS => 14

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_NARROW_WEEKDAYS => 15

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_QUARTERS => 16

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT_QUARTERS => 17

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_QUARTERS => 18

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_SHORT_QUARTERS => 19

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORTER_WEEKDAYS => 20

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_SHORTER_WEEKDAYS => 21

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_CYCLIC_YEARS_WIDE => 22

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_CYCLIC_YEARS_ABBREVIATED => 23

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_CYCLIC_YEARS_NARROW => 24

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ZODIAC_NAMES_WIDE => 25

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ZODIAC_NAMES_ABBREVIATED => 26

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_ZODIAC_NAMES_NARROW => 27

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_NARROW_QUARTERS => 28

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STANDALONE_NARROW_QUARTERS => 29
}
