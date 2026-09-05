#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleJustifyContent extends Win32Enum {

    /**
     * Native name: styleJustifyContentFlexStart
     * @type {Integer (Int32)}
     */
    static FlexStart => 0

    /**
     * Native name: styleJustifyContentFlexEnd
     * @type {Integer (Int32)}
     */
    static FlexEnd => 1

    /**
     * Native name: styleJustifyContentCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleJustifyContentSpaceBetween
     * @type {Integer (Int32)}
     */
    static SpaceBetween => 3

    /**
     * Native name: styleJustifyContentSpaceAround
     * @type {Integer (Int32)}
     */
    static SpaceAround => 4

    /**
     * Native name: styleJustifyContentNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 5

    /**
     * Native name: styleJustifyContent_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
