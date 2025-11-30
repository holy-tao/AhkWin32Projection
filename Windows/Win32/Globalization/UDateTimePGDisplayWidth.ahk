#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateTimePGDisplayWidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_WIDE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_ABBREVIATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_NARROW => 2
}
