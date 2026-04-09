#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class USentenceBreakTag extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_TERM => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_TERM_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_SEP => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_SEP_LIMIT => 200
}
