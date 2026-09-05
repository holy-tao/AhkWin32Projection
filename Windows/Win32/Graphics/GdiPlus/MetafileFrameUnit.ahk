#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class MetafileFrameUnit extends Win32Enum {

    /**
     * Native name: MetafileFrameUnitPixel
     * @type {Integer (Int32)}
     */
    static Pixel => 2

    /**
     * Native name: MetafileFrameUnitPoint
     * @type {Integer (Int32)}
     */
    static Point => 3

    /**
     * Native name: MetafileFrameUnitInch
     * @type {Integer (Int32)}
     */
    static Inch => 4

    /**
     * Native name: MetafileFrameUnitDocument
     * @type {Integer (Int32)}
     */
    static Document => 5

    /**
     * Native name: MetafileFrameUnitMillimeter
     * @type {Integer (Int32)}
     */
    static Millimeter => 6

    /**
     * Native name: MetafileFrameUnitGdi
     * @type {Integer (Int32)}
     */
    static Gdi => 7
}
