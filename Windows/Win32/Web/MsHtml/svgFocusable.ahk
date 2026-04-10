#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class svgFocusable extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableTrue => 2

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusableFalse => 3

    /**
     * @type {Integer (Int32)}
     */
    static svgFocusable_Max => 2147483647
}
