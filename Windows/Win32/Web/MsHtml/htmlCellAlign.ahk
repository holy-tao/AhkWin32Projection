#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlCellAlign extends Win32Enum {

    /**
     * Native name: htmlCellAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlCellAlignLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: htmlCellAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: htmlCellAlignRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: htmlCellAlignMiddle
     * @type {Integer (Int32)}
     */
    static Middle => 2

    /**
     * Native name: htmlCellAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
