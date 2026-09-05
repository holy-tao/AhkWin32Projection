#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlClear extends Win32Enum {

    /**
     * Native name: htmlClearNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlClearAll
     * @type {Integer (Int32)}
     */
    static All => 1

    /**
     * Native name: htmlClearLeft
     * @type {Integer (Int32)}
     */
    static Left => 2

    /**
     * Native name: htmlClearRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: htmlClearBoth
     * @type {Integer (Int32)}
     */
    static Both => 4

    /**
     * Native name: htmlClearNone
     * @type {Integer (Int32)}
     */
    static None => 5

    /**
     * Native name: htmlClear_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
