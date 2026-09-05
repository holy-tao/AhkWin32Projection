#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a range of tile mappings to use with ID3D11DeviceContext2::UpdateTiles.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_tile_range_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_TILE_RANGE_FLAG extends Win32Enum {

    /**
     * The tile range is <b>NULL</b>.
     * Native name: D3D11_TILE_RANGE_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 1

    /**
     * Skip the tile range.
     * Native name: D3D11_TILE_RANGE_SKIP
     * @type {Integer (Int32)}
     */
    static SKIP => 2

    /**
     * Reuse a single tile in the tile range.
     * Native name: D3D11_TILE_RANGE_REUSE_SINGLE_TILE
     * @type {Integer (Int32)}
     */
    static REUSE_SINGLE_TILE => 4
}
