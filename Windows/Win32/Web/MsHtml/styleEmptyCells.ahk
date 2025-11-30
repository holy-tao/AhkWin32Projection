#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleEmptyCells extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleEmptyCellsNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleEmptyCellsShow => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleEmptyCellsHide => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleEmptyCells_Max => 2147483647
}
