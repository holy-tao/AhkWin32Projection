#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWordBreak extends Win32Enum {

    /**
     * Native name: styleWordBreakNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleWordBreakNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: styleWordBreakBreakAll
     * @type {Integer (Int32)}
     */
    static BreakAll => 2

    /**
     * Native name: styleWordBreakKeepAll
     * @type {Integer (Int32)}
     */
    static KeepAll => 3

    /**
     * Native name: styleWordBreak_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
