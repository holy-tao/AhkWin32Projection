#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the intended format for the day in a [DateTimeFormatter](datetimeformatter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.dayformat
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class DayFormat extends Win32Enum{

    /**
     * Do not display the day.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Display the day in the most natural way. This will depend on the context, such as the language or calendar (for example, for the Hebrew calendar and Hebrew language, use the Hebrew numbering system).
     * @type {Integer (Int32)}
     */
    static Default => 1
}
