#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleWrapThrough extends Win32Enum {

    /**
     * Native name: styleWrapThroughNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleWrapThroughWrap
     * @type {Integer (Int32)}
     */
    static Wrap => 1

    /**
     * Native name: styleWrapThroughNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: styleWrapThrough_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
