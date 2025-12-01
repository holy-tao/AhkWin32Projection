#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class DriverStringOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsCmapLookup => 1

    /**
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsVertical => 2

    /**
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsRealizedAdvance => 4

    /**
     * @type {Integer (Int32)}
     */
    static DriverStringOptionsLimitSubpixel => 8
}
