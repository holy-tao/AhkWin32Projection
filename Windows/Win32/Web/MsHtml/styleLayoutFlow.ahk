#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLayoutFlow extends Win32Enum {

    /**
     * Native name: styleLayoutFlowHorizontal
     * @type {Integer (Int32)}
     */
    static Horizontal => 0

    /**
     * Native name: styleLayoutFlowVerticalIdeographic
     * @type {Integer (Int32)}
     */
    static VerticalIdeographic => 1

    /**
     * Native name: styleLayoutFlowNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleLayoutFlow_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
