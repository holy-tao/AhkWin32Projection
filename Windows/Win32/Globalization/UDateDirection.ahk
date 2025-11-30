#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDateDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_LAST_2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_LAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_THIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_NEXT => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_NEXT_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_PLAIN => 5

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_DIRECTION_COUNT => 6
}
