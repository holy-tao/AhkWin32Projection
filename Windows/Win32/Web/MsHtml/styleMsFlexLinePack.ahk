#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsFlexLinePack extends Win32Enum {

    /**
     * Native name: styleMsFlexLinePackStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: styleMsFlexLinePackEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleMsFlexLinePackCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleMsFlexLinePackJustify
     * @type {Integer (Int32)}
     */
    static Justify => 3

    /**
     * Native name: styleMsFlexLinePackDistribute
     * @type {Integer (Int32)}
     */
    static Distribute => 4

    /**
     * Native name: styleMsFlexLinePackStretch
     * @type {Integer (Int32)}
     */
    static Stretch => 5

    /**
     * Native name: styleMsFlexLinePackNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 6

    /**
     * Native name: styleMsFlexLinePack_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
