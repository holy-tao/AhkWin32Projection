#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UBreakIteratorType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_CHARACTER => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE => 3
}
