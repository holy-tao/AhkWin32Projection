#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UWordBreak extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NONE_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NUMBER => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NUMBER_LIMIT => 200

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_LETTER => 200

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_LETTER_LIMIT => 300

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_KANA => 300

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_KANA_LIMIT => 400

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_IDEO => 400

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_IDEO_LIMIT => 500
}
