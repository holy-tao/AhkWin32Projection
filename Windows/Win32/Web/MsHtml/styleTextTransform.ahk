#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleTextTransform extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformCapitalize => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformLowercase => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformUppercase => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransformNone => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleTextTransform_Max => 2147483647
}
