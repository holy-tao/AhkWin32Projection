#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the intended format for the day of the week in a [DateTimeFormatter](datetimeformatter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.dayofweekformat
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class DayOfWeekFormat extends Win32Enum{

    /**
     * Do not display the day of the week.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Display the day of the week in the most natural way. It may be abbreviated or full depending on the context, such as the language or calendar that is being used.
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * Display an abbreviated version of the day of the week (for example, "Thur" for Thursday).
     * @type {Integer (Int32)}
     */
    static Abbreviated => 2

    /**
     * Display the day of the week in its entirety (for example, "Thursday").
     * @type {Integer (Int32)}
     */
    static Full => 3
}
