#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class FillMode extends Win32Enum {

    /**
     * Native name: FillModeAlternate
     * @type {Integer (Int32)}
     */
    static Alternate => 0

    /**
     * Native name: FillModeWinding
     * @type {Integer (Int32)}
     */
    static Winding => 1
}
