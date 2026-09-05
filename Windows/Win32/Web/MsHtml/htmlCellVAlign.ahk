#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlCellVAlign extends Win32Enum {

    /**
     * Native name: htmlCellVAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlCellVAlignTop
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Native name: htmlCellVAlignMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 2

    /**
     * Native name: htmlCellVAlignBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 3

    /**
     * Native name: htmlCellVAlignBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 4

    /**
     * Native name: htmlCellVAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: htmlCellVAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
