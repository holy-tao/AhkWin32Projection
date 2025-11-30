#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTimeZoneFormatGMTOffsetPatternType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_POSITIVE_HM => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_POSITIVE_HMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_HM => 2

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_HMS => 3

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_POSITIVE_H => 4

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_H => 5

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_COUNT => 6
}
