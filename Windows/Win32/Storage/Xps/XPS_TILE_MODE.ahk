#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the tiling behavior of a tile brush.
 * @remarks
 * The following illustration shows the effect of each tile mode on how a tiled brush fills the output area.
 * 
 * <img alt="An illustration that shows different examples of different tile mode behaviors" src="./images/TileMode.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_TILE_MODE extends Win32Enum {

    /**
     * Only the base tile is drawn.
     * Native name: XPS_TILE_MODE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 1

    /**
     * First, the base tile is drawn. Next, the remaining area is filled by repeating the base tile such that the right edge of one tile is adjacent to the left edge of the next, and similarly for bottom and top.
     * Native name: XPS_TILE_MODE_TILE
     * @type {Integer (Int32)}
     */
    static TILE => 2

    /**
     * The same as <b>XPS_TILE_MODE_TILE</b>, but alternate columns of tiles are flipped horizontally.
     * Native name: XPS_TILE_MODE_FLIPX
     * @type {Integer (Int32)}
     */
    static FLIPX => 3

    /**
     * The same as <b>XPS_TILE_MODE_TILE</b>, but alternate rows of tiles are flipped vertically.
     * Native name: XPS_TILE_MODE_FLIPY
     * @type {Integer (Int32)}
     */
    static FLIPY => 4

    /**
     * The combination of the effects produced by <b>XPS_TILE_MODE_FLIPX</b> and <b>XPS_TILE_MODE_FLIPY</b>.
     * Native name: XPS_TILE_MODE_FLIPXY
     * @type {Integer (Int32)}
     */
    static FLIPXY => 5
}
