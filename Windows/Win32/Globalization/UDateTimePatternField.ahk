#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateTimePatternField extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_ERA_FIELD => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_YEAR_FIELD => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_QUARTER_FIELD => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_MONTH_FIELD => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_WEEK_OF_YEAR_FIELD => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_WEEK_OF_MONTH_FIELD => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_WEEKDAY_FIELD => 6

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_DAY_OF_YEAR_FIELD => 7

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_DAY_OF_WEEK_IN_MONTH_FIELD => 8

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_DAY_FIELD => 9

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_DAYPERIOD_FIELD => 10

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_HOUR_FIELD => 11

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_MINUTE_FIELD => 12

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_SECOND_FIELD => 13

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_FRACTIONAL_SECOND_FIELD => 14

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_ZONE_FIELD => 15

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_FIELD_COUNT => 16
}
