#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a tiled subresource volume. (D3D12_SUBRESOURCE_TILING)
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourcetiling">GetResourceTiling</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_tiling
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SUBRESOURCE_TILING {
    #StructPack 4

    /**
     * The width in tiles of the subresource.
     */
    WidthInTiles : UInt32

    /**
     * The height in tiles of the subresource.
     */
    HeightInTiles : UInt16

    /**
     * The depth in tiles of the subresource.
     */
    DepthInTiles : UInt16

    /**
     * The index of the tile in the overall tiled subresource to start with.
     */
    StartTileIndexInOverallResource : UInt32

}
