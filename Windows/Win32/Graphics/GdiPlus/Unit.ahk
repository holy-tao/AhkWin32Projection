#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class Unit extends Win32Enum {

    /**
     * Native name: UnitWorld
     * @type {Integer (Int32)}
     */
    static World => 0

    /**
     * Native name: UnitDisplay
     * @type {Integer (Int32)}
     */
    static Display => 1

    /**
     * Native name: UnitPixel
     * @type {Integer (Int32)}
     */
    static Pixel => 2

    /**
     * Native name: UnitPoint
     * @type {Integer (Int32)}
     */
    static Point => 3

    /**
     * Native name: UnitInch
     * @type {Integer (Int32)}
     */
    static Inch => 4

    /**
     * Native name: UnitDocument
     * @type {Integer (Int32)}
     */
    static Document => 5

    /**
     * Native name: UnitMillimeter
     * @type {Integer (Int32)}
     */
    static Millimeter => 6
}
