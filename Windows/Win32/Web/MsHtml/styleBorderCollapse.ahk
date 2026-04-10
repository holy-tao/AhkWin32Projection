#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBorderCollapse extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderCollapseNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderCollapseSeparate => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderCollapseCollapse => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBorderCollapse_Max => 2147483647
}
