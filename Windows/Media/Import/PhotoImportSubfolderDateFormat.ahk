#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the date format of a subfolder for a photo import operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportsubfolderdateformat
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportSubfolderDateFormat extends Win32Enum{

    /**
     * The date format specifies a year.
     * @type {Integer (Int32)}
     */
    static Year => 0

    /**
     * The date format specifies year and month.
     * @type {Integer (Int32)}
     */
    static YearMonth => 1

    /**
     * The date format specifies a year, month, and day.
     * @type {Integer (Int32)}
     */
    static YearMonthDay => 2
}
