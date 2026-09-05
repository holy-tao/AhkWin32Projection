#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleAlignContent extends Win32Enum {

    /**
     * Native name: styleAlignContentFlexStart
     * @type {Integer (Int32)}
     */
    static FlexStart => 0

    /**
     * Native name: styleAlignContentFlexEnd
     * @type {Integer (Int32)}
     */
    static FlexEnd => 1

    /**
     * Native name: styleAlignContentCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleAlignContentSpaceBetween
     * @type {Integer (Int32)}
     */
    static SpaceBetween => 3

    /**
     * Native name: styleAlignContentSpaceAround
     * @type {Integer (Int32)}
     */
    static SpaceAround => 4

    /**
     * Native name: styleAlignContentStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 5

    /**
     * Native name: styleAlignContentNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 6

    /**
     * Native name: styleAlignContent_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
