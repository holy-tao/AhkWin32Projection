#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTransformStyle extends Win32Enum {

    /**
     * Native name: styleTransformStyleFlat
     * @type {Integer (Int32)}
     */
    static Flat => 0

    /**
     * Native name: styleTransformStylePreserve3D
     * @type {Integer (Int32)}
     */
    static Preserve3D => 1

    /**
     * Native name: styleTransformStyleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleTransformStyle_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
