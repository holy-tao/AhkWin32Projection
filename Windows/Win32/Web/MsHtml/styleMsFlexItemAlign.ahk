#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsFlexItemAlign extends Win32Enum {

    /**
     * Native name: styleMsFlexItemAlignStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: styleMsFlexItemAlignEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleMsFlexItemAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleMsFlexItemAlignBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 3

    /**
     * Native name: styleMsFlexItemAlignStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 4

    /**
     * Native name: styleMsFlexItemAlignAuto
     * @type {Integer (Int32)}
     */
    static Auto => 5

    /**
     * Native name: styleMsFlexItemAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 6

    /**
     * Native name: styleMsFlexItemAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
