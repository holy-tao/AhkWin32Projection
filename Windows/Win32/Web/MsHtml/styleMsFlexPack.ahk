#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsFlexPack extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackJustify => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackDistribute => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPackNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleMsFlexPack_Max => 2147483647
}
