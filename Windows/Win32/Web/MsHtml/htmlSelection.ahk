#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlSelection extends Win32Enum {

    /**
     * Native name: htmlSelectionNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: htmlSelectionText
     * @type {Integer (Int32)}
     */
    static Text => 1

    /**
     * Native name: htmlSelectionControl
     * @type {Integer (Int32)}
     */
    static Control => 2

    /**
     * Native name: htmlSelectionTable
     * @type {Integer (Int32)}
     */
    static Table => 3

    /**
     * Native name: htmlSelection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
