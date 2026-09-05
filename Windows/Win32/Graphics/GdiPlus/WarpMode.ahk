#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class WarpMode extends Win32Enum {

    /**
     * Native name: WarpModePerspective
     * @type {Integer (Int32)}
     */
    static Perspective => 0

    /**
     * Native name: WarpModeBilinear
     * @type {Integer (Int32)}
     */
    static Bilinear => 1
}
