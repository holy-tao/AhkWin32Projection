#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBorderStyle extends Win32Enum {

    /**
     * Native name: styleBorderStyleNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBorderStyleDotted
     * @type {Integer (Int32)}
     */
    static Dotted => 1

    /**
     * Native name: styleBorderStyleDashed
     * @type {Integer (Int32)}
     */
    static Dashed => 2

    /**
     * Native name: styleBorderStyleSolid
     * @type {Integer (Int32)}
     */
    static Solid => 3

    /**
     * Native name: styleBorderStyleDouble
     * @type {Integer (Int32)}
     */
    static Double => 4

    /**
     * Native name: styleBorderStyleGroove
     * @type {Integer (Int32)}
     */
    static Groove => 5

    /**
     * Native name: styleBorderStyleRidge
     * @type {Integer (Int32)}
     */
    static Ridge => 6

    /**
     * Native name: styleBorderStyleInset
     * @type {Integer (Int32)}
     */
    static Inset => 7

    /**
     * Native name: styleBorderStyleOutset
     * @type {Integer (Int32)}
     */
    static Outset => 8

    /**
     * Native name: styleBorderStyleWindowInset
     * @type {Integer (Int32)}
     */
    static WindowInset => 9

    /**
     * Native name: styleBorderStyleNone
     * @type {Integer (Int32)}
     */
    static None => 10

    /**
     * Native name: styleBorderStyleHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 11

    /**
     * Native name: styleBorderStyle_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
