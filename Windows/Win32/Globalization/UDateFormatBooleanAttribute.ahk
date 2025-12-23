#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateFormatBooleanAttribute extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_ALLOW_WHITESPACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_ALLOW_NUMERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_PARTIAL_LITERAL_MATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_MULTIPLE_PATTERNS_FOR_MATCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_BOOLEAN_ATTRIBUTE_COUNT => 4
}
