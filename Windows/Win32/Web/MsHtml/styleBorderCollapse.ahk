#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBorderCollapse extends Win32Enum {

    /**
     * Native name: styleBorderCollapseNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBorderCollapseSeparate
     * @type {Integer (Int32)}
     */
    static Separate => 1

    /**
     * Native name: styleBorderCollapseCollapse
     * @type {Integer (Int32)}
     */
    static Collapse => 2

    /**
     * Native name: styleBorderCollapse_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
