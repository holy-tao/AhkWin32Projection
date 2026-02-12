#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the intended format for the second in a [DateTimeFormatter](datetimeformatter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.datetimeformatting.secondformat
 * @namespace Windows.Globalization.DateTimeFormatting
 * @version WindowsRuntime 1.4
 */
class SecondFormat extends Win32Enum{

    /**
     * Do not display the second.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Display the second in the most natural way. This will depend on the context, such as the language or clock that is being used.
     * @type {Integer (Int32)}
     */
    static Default => 1
}
