#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsOverflowStyle extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleScrollbar => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyleMsAutoHidingScrollbar => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsOverflowStyle_Max => 2147483647
}
