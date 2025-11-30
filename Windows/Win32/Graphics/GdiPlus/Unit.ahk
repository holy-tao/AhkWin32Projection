#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The Unit enumeration specifies the unit of measure for a given data type.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-unit
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Unit extends Win32Enum{

    /**
     * Specifies world coordinates, a nonphysical unit.
     * @type {Integer (Int32)}
     */
    static UnitWorld => 0

    /**
     * Specifies display units. For example, if the display device is a monitor, then the unit is 1 pixel.
     * @type {Integer (Int32)}
     */
    static UnitDisplay => 1

    /**
     * Specifies that a unit is 1 pixel.
     * @type {Integer (Int32)}
     */
    static UnitPixel => 2

    /**
     * Specifies that a unit is 1 point or 1/72 inch.
     * @type {Integer (Int32)}
     */
    static UnitPoint => 3

    /**
     * Specifies that a unit is 1 inch.
     * @type {Integer (Int32)}
     */
    static UnitInch => 4

    /**
     * Specifies that a unit is 1/300 inch.
     * @type {Integer (Int32)}
     */
    static UnitDocument => 5

    /**
     * Specifies that a unit is 1 millimeter.
     * @type {Integer (Int32)}
     */
    static UnitMillimeter => 6
}
