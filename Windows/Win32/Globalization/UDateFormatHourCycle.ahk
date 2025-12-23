#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateFormatHourCycle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_HOUR_CYCLE_11 => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_HOUR_CYCLE_12 => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_HOUR_CYCLE_23 => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_HOUR_CYCLE_24 => 3
}
