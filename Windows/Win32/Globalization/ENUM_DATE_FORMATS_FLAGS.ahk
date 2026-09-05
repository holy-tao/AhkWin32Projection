#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class ENUM_DATE_FORMATS_FLAGS extends Win32Enum {

    /**
     * Native name: DATE_SHORTDATE
     * @type {Integer (UInt32)}
     */
    static SHORTDATE => 1

    /**
     * Native name: DATE_LONGDATE
     * @type {Integer (UInt32)}
     */
    static LONGDATE => 2

    /**
     * Native name: DATE_YEARMONTH
     * @type {Integer (UInt32)}
     */
    static YEARMONTH => 8

    /**
     * Native name: DATE_MONTHDAY
     * @type {Integer (UInt32)}
     */
    static MONTHDAY => 128

    /**
     * Native name: DATE_AUTOLAYOUT
     * @type {Integer (UInt32)}
     */
    static AUTOLAYOUT => 64

    /**
     * Native name: DATE_LTRREADING
     * @type {Integer (UInt32)}
     */
    static LTRREADING => 16

    /**
     * Native name: DATE_RTLREADING
     * @type {Integer (UInt32)}
     */
    static RTLREADING => 32

    /**
     * Native name: DATE_USE_ALT_CALENDAR
     * @type {Integer (UInt32)}
     */
    static USE_ALT_CALENDAR => 4
}
