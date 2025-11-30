#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ENUM_DATE_FORMATS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_SHORTDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_LONGDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_YEARMONTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_MONTHDAY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_AUTOLAYOUT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_LTRREADING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_RTLREADING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DATE_USE_ALT_CALENDAR => 4
}
