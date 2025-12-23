#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTimeZoneFormatStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_GENERIC_LOCATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_GENERIC_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_GENERIC_SHORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_SPECIFIC_LONG => 3

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_SPECIFIC_SHORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_LOCALIZED_GMT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_LOCALIZED_GMT_SHORT => 6

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_SHORT => 7

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_SHORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_FIXED => 9

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_FIXED => 10

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_FULL => 11

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_FULL => 12

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_FIXED => 13

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FIXED => 14

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_FULL => 15

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FULL => 16

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ZONE_ID => 17

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ZONE_ID_SHORT => 18

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_EXEMPLAR_LOCATION => 19
}
