#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UFormattableType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_DATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_DOUBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_LONG => 2

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_STRING => 3

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_ARRAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_INT64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_OBJECT => 6
}
