#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a range of tile mappings.
 * @remarks
 * Use these flags with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">ID3D12CommandQueue::UpdateTileMappings</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_range_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TILE_RANGE_FLAGS extends Win32Enum{

    /**
     * No tile-mapping flags are specified.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_RANGE_FLAG_NONE => 0

    /**
     * The tile range is <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_RANGE_FLAG_NULL => 1

    /**
     * Skip the tile range.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_RANGE_FLAG_SKIP => 2

    /**
     * Reuse a single tile in the tile range.
     * @type {Integer (Int32)}
     */
    static D3D12_TILE_RANGE_FLAG_REUSE_SINGLE_TILE => 4
}
