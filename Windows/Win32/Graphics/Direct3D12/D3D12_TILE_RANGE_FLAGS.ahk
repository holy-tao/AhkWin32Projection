#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of tile mappings.
 * @remarks
 * Use these flags with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">ID3D12CommandQueue::UpdateTileMappings</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_range_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TILE_RANGE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
