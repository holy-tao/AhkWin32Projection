#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsOverflowStyle extends Win32Enum {

    /**
     * Native name: styleMsOverflowStyleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsOverflowStyleAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleMsOverflowStyleNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: styleMsOverflowStyleScrollbar
     * @type {Integer (Int32)}
     */
    static Scrollbar => 3

    /**
     * Native name: styleMsOverflowStyleMsAutoHidingScrollbar
     * @type {Integer (Int32)}
     */
    static MsAutoHidingScrollbar => 4

    /**
     * Native name: styleMsOverflowStyle_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
