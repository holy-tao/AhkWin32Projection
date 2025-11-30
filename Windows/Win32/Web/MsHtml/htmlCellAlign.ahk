#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlCellAlign extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlignMiddle => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCellAlign_Max => 2147483647
}
