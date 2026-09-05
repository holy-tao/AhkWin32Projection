#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleEmptyCells extends Win32Enum {

    /**
     * Native name: styleEmptyCellsNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleEmptyCellsShow
     * @type {Integer (Int32)}
     */
    static Show => 1

    /**
     * Native name: styleEmptyCellsHide
     * @type {Integer (Int32)}
     */
    static Hide => 2

    /**
     * Native name: styleEmptyCells_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
