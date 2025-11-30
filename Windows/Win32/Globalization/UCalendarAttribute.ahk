#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCalendarAttribute extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_LENIENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_FIRST_DAY_OF_WEEK => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MINIMAL_DAYS_IN_FIRST_WEEK => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_REPEATED_WALL_TIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SKIPPED_WALL_TIME => 4
}
