#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MetafileFrameUnit enumeration specifies the unit of measure for a metafile frame rectangle.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-metafileframeunit
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class MetafileFrameUnit extends Win32Enum{

    /**
     * Specifies that a unit is 1 pixel.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitPixel => 2

    /**
     * Specifies that a unit is 1 point.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitPoint => 3

    /**
     * Specifies that a unit is 1 inch.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitInch => 4

    /**
     * Specifies that a unit is 1/300 inch.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitDocument => 5

    /**
     * Specifies that a unit is 1 millimeter.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitMillimeter => 6

    /**
     * Specifies that a unit is 0.01 millimeter. This element is provided for compatibility with GDI.
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitGdi => 7
}
