#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class WrapMode extends Win32Enum {

    /**
     * Native name: WrapModeTile
     * @type {Integer (Int32)}
     */
    static Tile => 0

    /**
     * Native name: WrapModeTileFlipX
     * @type {Integer (Int32)}
     */
    static TileFlipX => 1

    /**
     * Native name: WrapModeTileFlipY
     * @type {Integer (Int32)}
     */
    static TileFlipY => 2

    /**
     * Native name: WrapModeTileFlipXY
     * @type {Integer (Int32)}
     */
    static TileFlipXY => 3

    /**
     * Native name: WrapModeClamp
     * @type {Integer (Int32)}
     */
    static Clamp => 4
}
