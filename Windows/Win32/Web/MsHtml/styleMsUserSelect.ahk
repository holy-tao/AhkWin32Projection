#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsUserSelect extends Win32Enum {

    /**
     * Native name: styleMsUserSelectAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleMsUserSelectText
     * @type {Integer (Int32)}
     */
    static Text => 1

    /**
     * Native name: styleMsUserSelectElement
     * @type {Integer (Int32)}
     */
    static Element => 2

    /**
     * Native name: styleMsUserSelectNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: styleMsUserSelectNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleMsUserSelect_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
