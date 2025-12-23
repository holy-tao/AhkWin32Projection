#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlClear extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearAll => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearLeft => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearBoth => 4

    /**
     * @type {Integer (Int32)}
     */
    static htmlClearNone => 5

    /**
     * @type {Integer (Int32)}
     */
    static htmlClear_Max => 2147483647
}
