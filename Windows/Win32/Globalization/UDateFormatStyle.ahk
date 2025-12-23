#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateFormatStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_MEDIUM => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DEFAULT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_RELATIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_FULL_RELATIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_LONG_RELATIVE => 129

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_MEDIUM_RELATIVE => 130

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_SHORT_RELATIVE => 131

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_NONE => -1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PATTERN => -2
}
