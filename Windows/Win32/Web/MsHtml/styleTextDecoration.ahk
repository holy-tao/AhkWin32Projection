#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextDecoration extends Win32Enum {

    /**
     * Native name: styleTextDecorationNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleTextDecorationUnderline
     * @type {Integer (Int32)}
     */
    static Underline => 1

    /**
     * Native name: styleTextDecorationOverline
     * @type {Integer (Int32)}
     */
    static Overline => 2

    /**
     * Native name: styleTextDecorationLineThrough
     * @type {Integer (Int32)}
     */
    static LineThrough => 3

    /**
     * Native name: styleTextDecorationBlink
     * @type {Integer (Int32)}
     */
    static Blink => 4

    /**
     * Native name: styleTextDecoration_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
