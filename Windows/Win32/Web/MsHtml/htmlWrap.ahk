#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlWrap extends Win32Enum {

    /**
     * Native name: htmlWrapOff
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Native name: htmlWrapSoft
     * @type {Integer (Int32)}
     */
    static Soft => 2

    /**
     * Native name: htmlWrapHard
     * @type {Integer (Int32)}
     */
    static Hard => 3

    /**
     * Native name: htmlWrap_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
