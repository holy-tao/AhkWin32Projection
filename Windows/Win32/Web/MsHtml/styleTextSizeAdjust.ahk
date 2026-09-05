#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextSizeAdjust extends Win32Enum {

    /**
     * Native name: styleTextSizeAdjustNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleTextSizeAdjustAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleTextSizeAdjust_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
