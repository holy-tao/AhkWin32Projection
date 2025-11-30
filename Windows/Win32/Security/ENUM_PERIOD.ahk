#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the units of a time span.
 * @see https://docs.microsoft.com/windows/win32/api//celib/ne-celib-enum_period
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ENUM_PERIOD extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_INVALID => -1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_SECONDS => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_MINUTES => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_HOURS => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_DAYS => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_WEEKS => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_MONTHS => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_PERIOD_YEARS => 6
}
