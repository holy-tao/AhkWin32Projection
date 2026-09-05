#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlBlockAlign extends Win32Enum {

    /**
     * Native name: htmlBlockAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlBlockAlignLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: htmlBlockAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: htmlBlockAlignRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: htmlBlockAlignJustify
     * @type {Integer (Int32)}
     */
    static Justify => 4

    /**
     * Native name: htmlBlockAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
