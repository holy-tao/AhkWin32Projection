#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCalendarWeekdayType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEEKDAY => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEEKEND => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEEKEND_ONSET => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WEEKEND_CEASE => 3
}
