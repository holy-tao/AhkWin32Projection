#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsImeAlign extends Win32Enum {

    /**
     * Native name: styleMsImeAlignAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleMsImeAlignAfter
     * @type {Integer (Int32)}
     */
    static After => 1

    /**
     * Native name: styleMsImeAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 2

    /**
     * Native name: styleMsImeAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
