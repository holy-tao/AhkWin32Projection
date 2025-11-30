#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class URelativeDateTimeFormatterField extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_REL_LITERAL_FIELD => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_REL_NUMERIC_FIELD => 1
}
