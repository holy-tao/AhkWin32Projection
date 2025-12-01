#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class MetafileFrameUnit extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitPixel => 2

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitPoint => 3

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitInch => 4

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitDocument => 5

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitMillimeter => 6

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitGdi => 7
}
