#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsFlexPack extends Win32Enum {

    /**
     * Native name: styleMsFlexPackStart
     * @type {Integer (Int32)}
     */
    static Start => 0

    /**
     * Native name: styleMsFlexPackEnd
     * @type {Integer (Int32)}
     */
    static End => 1

    /**
     * Native name: styleMsFlexPackCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleMsFlexPackJustify
     * @type {Integer (Int32)}
     */
    static Justify => 3

    /**
     * Native name: styleMsFlexPackDistribute
     * @type {Integer (Int32)}
     */
    static Distribute => 4

    /**
     * Native name: styleMsFlexPackNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 5

    /**
     * Native name: styleMsFlexPack_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
