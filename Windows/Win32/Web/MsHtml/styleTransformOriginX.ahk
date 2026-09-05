#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTransformOriginX extends Win32Enum {

    /**
     * Native name: styleTransformOriginXNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTransformOriginXLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: styleTransformOriginXCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleTransformOriginXRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: styleTransformOriginX_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
