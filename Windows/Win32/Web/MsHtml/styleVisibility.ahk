#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleVisibility extends Win32Enum {

    /**
     * Native name: styleVisibilityNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleVisibilityInherit
     * @type {Integer (Int32)}
     */
    static Inherit => 1

    /**
     * Native name: styleVisibilityVisible
     * @type {Integer (Int32)}
     */
    static Visible => 2

    /**
     * Native name: styleVisibilityHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 3

    /**
     * Native name: styleVisibilityCollapse
     * @type {Integer (Int32)}
     */
    static Collapse => 4

    /**
     * Native name: styleVisibility_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
