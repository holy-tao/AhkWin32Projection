#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTimeZoneLocalOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_FORMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_LATTER => 12

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_STANDARD_FORMER => 5

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_STANDARD_LATTER => 13

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_DAYLIGHT_FORMER => 7

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_TZ_LOCAL_DAYLIGHT_LATTER => 15
}
