#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ULineBreakTag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_SOFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_SOFT_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_HARD => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_LINE_HARD_LIMIT => 200
}
