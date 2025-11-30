#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateRelativeDateTimeFormatterStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STYLE_LONG => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STYLE_SHORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_STYLE_NARROW => 2
}
