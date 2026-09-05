#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleAlignItems extends Win32Enum {

    /**
     * Native name: styleAlignItemsFlexStart
     * @type {Integer (Int32)}
     */
    static FlexStart => 0

    /**
     * Native name: styleAlignItemsFlexEnd
     * @type {Integer (Int32)}
     */
    static FlexEnd => 1

    /**
     * Native name: styleAlignItemsCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleAlignItemsBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 3

    /**
     * Native name: styleAlignItemsStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 4

    /**
     * Native name: styleAlignItemsNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 5

    /**
     * Native name: styleAlignItems_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
