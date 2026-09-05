#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class CARET_DIRECTION extends Win32Enum {

    /**
     * Native name: CARET_DIRECTION_INDETERMINATE
     * @type {Integer (Int32)}
     */
    static INDETERMINATE => 0

    /**
     * Native name: CARET_DIRECTION_SAME
     * @type {Integer (Int32)}
     */
    static SAME => 1

    /**
     * Native name: CARET_DIRECTION_BACKWARD
     * @type {Integer (Int32)}
     */
    static BACKWARD => 2

    /**
     * Native name: CARET_DIRECTION_FORWARD
     * @type {Integer (Int32)}
     */
    static FORWARD => 3

    /**
     * Native name: CARET_DIRECTION_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
