#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCalendarDaysOfWeek extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SUNDAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MONDAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TUESDAY => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEDNESDAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_THURSDAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_FRIDAY => 6

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_SATURDAY => 7
}
