#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the normalization format of an [AlternateWordForm](alternatewordform.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.alternatenormalizationformat
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class AlternateNormalizationFormat extends Win32Enum{

    /**
     * A regular string that has not been recognized as a number, currency, date, or time.
     * @type {Integer (Int32)}
     */
    static NotNormalized => 0

    /**
     * A string that has been recognized as a number.
     * @type {Integer (Int32)}
     */
    static Number => 1

    /**
     * A string that has been recognized as a monetary amount.
     * @type {Integer (Int32)}
     */
    static Currency => 3

    /**
     * A string that has been recognized as a date.
     * @type {Integer (Int32)}
     */
    static Date => 4

    /**
     * A string that has been recognized as a time.
     * @type {Integer (Int32)}
     */
    static Time => 5
}
