#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the intended format for the year in a [DateTimeFormatter](datetimeformatter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.yearformat
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class YearFormat extends Win32Enum{

    /**
     * Do not display the year.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Display the year in the most natural way. It may be abbreviated or full depending on the context, such as the language or calendar that is being used.
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * Display an abbreviated version of the year (for example, "11" for Gregorian 2011).
     * @type {Integer (Int32)}
     */
    static Abbreviated => 2

    /**
     * Display the year in its entirety (for example, "2011" for Gregorian 2011).
     * @type {Integer (Int32)}
     */
    static Full => 3
}
