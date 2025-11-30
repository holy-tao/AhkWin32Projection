#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PreferredFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FormatNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static FormatSingleCharacter => 1

    /**
     * @type {Integer (Int32)}
     */
    static FormatQuotedString => 2

    /**
     * @type {Integer (Int32)}
     */
    static FormatString => 3

    /**
     * @type {Integer (Int32)}
     */
    static FormatQuotedUnicodeString => 4

    /**
     * @type {Integer (Int32)}
     */
    static FormatUnicodeString => 5

    /**
     * @type {Integer (Int32)}
     */
    static FormatQuotedUTF8String => 6

    /**
     * @type {Integer (Int32)}
     */
    static FormatUTF8String => 7

    /**
     * @type {Integer (Int32)}
     */
    static FormatBSTRString => 8

    /**
     * @type {Integer (Int32)}
     */
    static FormatQuotedHString => 9

    /**
     * @type {Integer (Int32)}
     */
    static FormatHString => 10

    /**
     * @type {Integer (Int32)}
     */
    static FormatRaw => 11

    /**
     * @type {Integer (Int32)}
     */
    static FormatEnumNameOnly => 12

    /**
     * @type {Integer (Int32)}
     */
    static FormatEscapedStringWithQuote => 13

    /**
     * @type {Integer (Int32)}
     */
    static FormatUTF32String => 14

    /**
     * @type {Integer (Int32)}
     */
    static FormatQuotedUTF32String => 15
}
