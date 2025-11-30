#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCalendarWallTimeOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WALLTIME_LAST => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WALLTIME_FIRST => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCAL_WALLTIME_NEXT_VALID => 2
}
