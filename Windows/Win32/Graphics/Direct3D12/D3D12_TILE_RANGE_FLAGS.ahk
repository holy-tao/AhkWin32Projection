#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a range of tile mappings.
 * @remarks
 * Use these flags with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">ID3D12CommandQueue::UpdateTileMappings</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_range_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TILE_RANGE_FLAGS extends Win32Enum {

    /**
     * No tile-mapping flags are specified.
     * Native name: D3D12_TILE_RANGE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * The tile range is <b>NULL</b>.
     * Native name: D3D12_TILE_RANGE_FLAG_NULL
     * @type {Integer (Int32)}
     */
    static FLAG_NULL => 1

    /**
     * Skip the tile range.
     * Native name: D3D12_TILE_RANGE_FLAG_SKIP
     * @type {Integer (Int32)}
     */
    static FLAG_SKIP => 2

    /**
     * Reuse a single tile in the tile range.
     * Native name: D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE
     * @type {Integer (Int32)}
     */
    static FLAG_REUSE_SINGLE_TILE => 4
}
