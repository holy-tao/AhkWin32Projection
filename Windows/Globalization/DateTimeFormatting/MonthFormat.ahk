#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the intended format for the month in a [DateTimeFormatter](datetimeformatter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.monthformat
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class MonthFormat extends Win32Enum{

    /**
     * Do not display the month.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Display the month in the most natural way. It may be abbreviated, full, or numeric depending on the context, such as the language or calendar that is being used.
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * Display an abbreviated version of the month (for example, "Sep" for September).
     * @type {Integer (Int32)}
     */
    static Abbreviated => 2

    /**
     * Display the month in its entirety (for example, "September").
     * @type {Integer (Int32)}
     */
    static Full => 3

    /**
     * Display the month as a number (for example, "9" for September).
     * @type {Integer (Int32)}
     */
    static Numeric => 4
}
