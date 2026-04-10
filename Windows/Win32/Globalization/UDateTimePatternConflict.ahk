#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UDateTimePatternConflict extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_NO_CONFLICT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_BASE_CONFLICT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_CONFLICT => 2
}
