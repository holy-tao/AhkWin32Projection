#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class textDecoration extends Win32Enum {

    /**
     * Native name: textDecorationNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: textDecorationUnderline
     * @type {Integer (Int32)}
     */
    static Underline => 1

    /**
     * Native name: textDecorationOverline
     * @type {Integer (Int32)}
     */
    static Overline => 2

    /**
     * Native name: textDecorationLineThrough
     * @type {Integer (Int32)}
     */
    static LineThrough => 3

    /**
     * Native name: textDecorationBlink
     * @type {Integer (Int32)}
     */
    static Blink => 4

    /**
     * Native name: textDecoration_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
