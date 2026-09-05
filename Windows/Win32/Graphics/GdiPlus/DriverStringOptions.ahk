#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class DriverStringOptions extends Win32Enum {

    /**
     * Native name: DriverStringOptionsCmapLookup
     * @type {Integer (Int32)}
     */
    static CmapLookup => 1

    /**
     * Native name: DriverStringOptionsVertical
     * @type {Integer (Int32)}
     */
    static Vertical => 2

    /**
     * Native name: DriverStringOptionsRealizedAdvance
     * @type {Integer (Int32)}
     */
    static RealizedAdvance => 4

    /**
     * Native name: DriverStringOptionsLimitSubpixel
     * @type {Integer (Int32)}
     */
    static LimitSubpixel => 8
}
