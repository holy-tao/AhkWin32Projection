#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Identifies the day of the week.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.dayofweek
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class DayOfWeek extends Win32Enum{

    /**
     * Sunday
     * @type {Integer (Int32)}
     */
    static Sunday => 0

    /**
     * Monday
     * @type {Integer (Int32)}
     */
    static Monday => 1

    /**
     * Tuesday
     * @type {Integer (Int32)}
     */
    static Tuesday => 2

    /**
     * Wednesday
     * @type {Integer (Int32)}
     */
    static Wednesday => 3

    /**
     * Thursday
     * @type {Integer (Int32)}
     */
    static Thursday => 4

    /**
     * Friday
     * @type {Integer (Int32)}
     */
    static Friday => 5

    /**
     * Saturday
     * @type {Integer (Int32)}
     */
    static Saturday => 6
}
