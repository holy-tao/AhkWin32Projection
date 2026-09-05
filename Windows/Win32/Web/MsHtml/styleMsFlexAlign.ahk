#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsFlexAlign extends Win32Enum {

    /**
     * Native name: styleMsFlexAlignStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: styleMsFlexAlignEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleMsFlexAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleMsFlexAlignBaseline
     * @type {Integer (Int32)}
     */
    static Baseline => 3

    /**
     * Native name: styleMsFlexAlignStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 4

    /**
     * Native name: styleMsFlexAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 5

    /**
     * Native name: styleMsFlexAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
