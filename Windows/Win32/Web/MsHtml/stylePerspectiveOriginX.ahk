#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class stylePerspectiveOriginX extends Win32Enum {

    /**
     * Native name: stylePerspectiveOriginXNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: stylePerspectiveOriginXLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: stylePerspectiveOriginXCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: stylePerspectiveOriginXRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: stylePerspectiveOriginX_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
