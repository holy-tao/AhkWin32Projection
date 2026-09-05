#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlEditable extends Win32Enum {

    /**
     * Native name: htmlEditableInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 0

    /**
     * Native name: htmlEditableTrue
     * @type {Integer (Int32)}
     */
    static True => 1

    /**
     * Native name: htmlEditableFalse
     * @type {Integer (Int32)}
     */
    static False => 2

    /**
     * Native name: htmlEditable_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
