#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTimeZoneFormatTimeType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_TIME_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_TIME_TYPE_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_TIME_TYPE_DAYLIGHT => 2
}
