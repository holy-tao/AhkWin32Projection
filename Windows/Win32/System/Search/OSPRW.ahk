#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class OSPRW extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_READONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_READWRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPRW_MIXED => 2
}
