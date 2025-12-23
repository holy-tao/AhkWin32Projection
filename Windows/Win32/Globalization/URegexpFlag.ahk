#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class URegexpFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_CASE_INSENSITIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_COMMENTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_DOTALL => 32

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_LITERAL => 16

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_MULTILINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_UNIX_LINES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_UWORD => 256

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_ERROR_ON_UNKNOWN_ESCAPES => 512
}
