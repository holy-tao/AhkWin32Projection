#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units of a time span.
 * @see https://learn.microsoft.com/windows/win32/api/celib/ne-celib-enum_period
 * @namespace Windows.Win32.Security
 */
class ENUM_PERIOD extends Win32Enum {

    /**
     * Native name: ENUM_PERIOD_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => -1

    /**
     * Native name: ENUM_PERIOD_SECONDS
     * @type {Integer (Int32)}
     */
    static SECONDS => 0

    /**
     * Native name: ENUM_PERIOD_MINUTES
     * @type {Integer (Int32)}
     */
    static MINUTES => 1

    /**
     * Native name: ENUM_PERIOD_HOURS
     * @type {Integer (Int32)}
     */
    static HOURS => 2

    /**
     * Native name: ENUM_PERIOD_DAYS
     * @type {Integer (Int32)}
     */
    static DAYS => 3

    /**
     * Native name: ENUM_PERIOD_WEEKS
     * @type {Integer (Int32)}
     */
    static WEEKS => 4

    /**
     * Native name: ENUM_PERIOD_MONTHS
     * @type {Integer (Int32)}
     */
    static MONTHS => 5

    /**
     * Native name: ENUM_PERIOD_YEARS
     * @type {Integer (Int32)}
     */
    static YEARS => 6
}
