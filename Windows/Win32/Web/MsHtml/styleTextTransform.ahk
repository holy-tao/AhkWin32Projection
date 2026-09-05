#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextTransform extends Win32Enum {

    /**
     * Native name: styleTextTransformNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTextTransformCapitalize
     * @type {Integer (Int32)}
     */
    static Capitalize => 1

    /**
     * Native name: styleTextTransformLowercase
     * @type {Integer (Int32)}
     */
    static Lowercase => 2

    /**
     * Native name: styleTextTransformUppercase
     * @type {Integer (Int32)}
     */
    static Uppercase => 3

    /**
     * Native name: styleTextTransformNone
     * @type {Integer (Int32)}
     */
    static None => 4

    /**
     * Native name: styleTextTransform_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
