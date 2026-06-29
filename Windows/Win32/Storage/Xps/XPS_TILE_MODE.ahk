#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the tiling behavior of a tile brush.
 * @remarks
 * The following illustration shows the effect of each tile mode on how a tiled brush fills the output area.
 * 
 * <img alt="An illustration that shows different examples of different tile mode behaviors" src="./images/TileMode.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_tile_mode
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_TILE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Only the base tile is drawn.
     * @type {Integer (Int32)}
     */
    static XPS_TILE_MODE_NONE => 1

    /**
     * First, the base tile is drawn. Next, the remaining area is filled by repeating the base tile such that the right edge of one tile is adjacent to the left edge of the next, and similarly for bottom and top.
     * @type {Integer (Int32)}
     */
    static XPS_TILE_MODE_TILE => 2

    /**
     * The same as <b>XPS_TILE_MODE_TILE</b>, but alternate columns of tiles are flipped horizontally.
     * @type {Integer (Int32)}
     */
    static XPS_TILE_MODE_FLIPX => 3

    /**
     * The same as <b>XPS_TILE_MODE_TILE</b>, but alternate rows of tiles are flipped vertically.
     * @type {Integer (Int32)}
     */
    static XPS_TILE_MODE_FLIPY => 4

    /**
     * The combination of the effects produced by <b>XPS_TILE_MODE_FLIPX</b> and <b>XPS_TILE_MODE_FLIPY</b>.
     * @type {Integer (Int32)}
     */
    static XPS_TILE_MODE_FLIPXY => 5
}
