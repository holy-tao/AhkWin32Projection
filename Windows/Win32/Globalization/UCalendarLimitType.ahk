#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCalendarLimitType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MINIMUM => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_MAXIMUM => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_GREATEST_MINIMUM => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_LEAST_MAXIMUM => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_ACTUAL_MINIMUM => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_ACTUAL_MAXIMUM => 5
}
