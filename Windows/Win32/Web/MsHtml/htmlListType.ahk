#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlListType extends Win32Enum {

    /**
     * Native name: htmlListTypeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlListTypeLargeAlpha
     * @type {Integer (Int32)}
     */
    static LargeAlpha => 1

    /**
     * Native name: htmlListTypeSmallAlpha
     * @type {Integer (Int32)}
     */
    static SmallAlpha => 2

    /**
     * Native name: htmlListTypeLargeRoman
     * @type {Integer (Int32)}
     */
    static LargeRoman => 3

    /**
     * Native name: htmlListTypeSmallRoman
     * @type {Integer (Int32)}
     */
    static SmallRoman => 4

    /**
     * Native name: htmlListTypeNumbers
     * @type {Integer (Int32)}
     */
    static Numbers => 5

    /**
     * Native name: htmlListTypeDisc
     * @type {Integer (Int32)}
     */
    static Disc => 6

    /**
     * Native name: htmlListTypeCircle
     * @type {Integer (Int32)}
     */
    static Circle => 7

    /**
     * Native name: htmlListTypeSquare
     * @type {Integer (Int32)}
     */
    static Square => 8

    /**
     * Native name: htmlListType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
