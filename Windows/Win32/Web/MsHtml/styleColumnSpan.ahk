#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleColumnSpan extends Win32Enum {

    /**
     * Native name: styleColumnSpanNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleColumnSpanAll
     * @type {Integer (Int32)}
     */
    static All => 1

    /**
     * Native name: styleColumnSpanOne
     * @type {Integer (Int32)}
     */
    static One => 2

    /**
     * Native name: styleColumnSpanNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleColumnSpan_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
