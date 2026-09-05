#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class DashCap extends Win32Enum {

    /**
     * Native name: DashCapFlat
     * @type {Integer (Int32)}
     */
    static Flat => 0

    /**
     * Native name: DashCapRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: DashCapTriangle
     * @type {Integer (Int32)}
     */
    static Triangle => 3
}
