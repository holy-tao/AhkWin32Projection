#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTransformOriginY extends Win32Enum {

    /**
     * Native name: styleTransformOriginYNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTransformOriginYTop
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Native name: styleTransformOriginYCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleTransformOriginYBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 3

    /**
     * Native name: styleTransformOriginY_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
