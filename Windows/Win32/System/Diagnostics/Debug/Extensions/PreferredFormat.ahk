#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class PreferredFormat extends Win32Enum {

    /**
     * Native name: FormatNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: FormatSingleCharacter
     * @type {Integer (Int32)}
     */
    static SingleCharacter => 1

    /**
     * Native name: FormatQuotedString
     * @type {Integer (Int32)}
     */
    static QuotedString => 2

    /**
     * Native name: FormatString
     * @type {Integer (Int32)}
     */
    static String => 3

    /**
     * Native name: FormatQuotedUnicodeString
     * @type {Integer (Int32)}
     */
    static QuotedUnicodeString => 4

    /**
     * Native name: FormatUnicodeString
     * @type {Integer (Int32)}
     */
    static UnicodeString => 5

    /**
     * Native name: FormatQuotedUTF8String
     * @type {Integer (Int32)}
     */
    static QuotedUTF8String => 6

    /**
     * @type {Integer (Int32)}
     */
    static FormatUTF8String => 7

    /**
     * @type {Integer (Int32)}
     */
    static FormatBSTRString => 8

    /**
     * Native name: FormatQuotedHString
     * @type {Integer (Int32)}
     */
    static QuotedHString => 9

    /**
     * @type {Integer (Int32)}
     */
    static FormatHString => 10

    /**
     * Native name: FormatRaw
     * @type {Integer (Int32)}
     */
    static Raw => 11

    /**
     * Native name: FormatEnumNameOnly
     * @type {Integer (Int32)}
     */
    static EnumNameOnly => 12

    /**
     * Native name: FormatEscapedStringWithQuote
     * @type {Integer (Int32)}
     */
    static EscapedStringWithQuote => 13

    /**
     * @type {Integer (Int32)}
     */
    static FormatUTF32String => 14

    /**
     * Native name: FormatQuotedUTF32String
     * @type {Integer (Int32)}
     */
    static QuotedUTF32String => 15
}
