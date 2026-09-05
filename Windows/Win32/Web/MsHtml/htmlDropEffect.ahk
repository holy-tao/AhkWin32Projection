#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlDropEffect extends Win32Enum {

    /**
     * Native name: htmlDropEffectCopy
     * @type {Integer (Int32)}
     */
    static Copy => 0

    /**
     * Native name: htmlDropEffectLink
     * @type {Integer (Int32)}
     */
    static Link => 1

    /**
     * Native name: htmlDropEffectMove
     * @type {Integer (Int32)}
     */
    static Move => 2

    /**
     * Native name: htmlDropEffectNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: htmlDropEffect_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
