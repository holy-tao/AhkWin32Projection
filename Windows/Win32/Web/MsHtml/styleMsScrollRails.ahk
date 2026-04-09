#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsScrollRails extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollRailsNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollRailsNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollRailsRailed => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsScrollRails_Max => 2147483647
}
