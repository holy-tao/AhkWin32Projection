#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class WrapMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTile => 0

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipX => 1

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipXY => 3

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeClamp => 4
}
