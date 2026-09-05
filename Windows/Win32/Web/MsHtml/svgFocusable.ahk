#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFocusable extends Win32Enum {

    /**
     * Native name: svgFocusableNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: svgFocusableAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: svgFocusableTrue
     * @type {Integer (Int32)}
     */
    static True => 2

    /**
     * Native name: svgFocusableFalse
     * @type {Integer (Int32)}
     */
    static False => 3

    /**
     * Native name: svgFocusable_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
