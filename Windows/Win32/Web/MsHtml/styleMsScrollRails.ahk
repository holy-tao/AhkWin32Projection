#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollRails extends Win32Enum {

    /**
     * Native name: styleMsScrollRailsNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsScrollRailsNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsScrollRailsRailed
     * @type {Integer (Int32)}
     */
    static Railed => 2

    /**
     * Native name: styleMsScrollRails_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
