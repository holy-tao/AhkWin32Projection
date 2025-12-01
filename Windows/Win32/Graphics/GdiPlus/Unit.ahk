#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Unit extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UnitWorld => 0

    /**
     * @type {Integer (Int32)}
     */
    static UnitDisplay => 1

    /**
     * @type {Integer (Int32)}
     */
    static UnitPixel => 2

    /**
     * @type {Integer (Int32)}
     */
    static UnitPoint => 3

    /**
     * @type {Integer (Int32)}
     */
    static UnitInch => 4

    /**
     * @type {Integer (Int32)}
     */
    static UnitDocument => 5

    /**
     * @type {Integer (Int32)}
     */
    static UnitMillimeter => 6
}
