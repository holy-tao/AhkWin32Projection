#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the shape of a tile by specifying its dimensions. (D3D12_TILE_SHAPE)
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourcetiling">GetResourceTiling</a>     method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tile_shape
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TILE_SHAPE {
    #StructPack 4

    /**
     * The width in texels of the tile.
     */
    WidthInTexels : UInt32

    /**
     * The height in texels of the tile.
     */
    HeightInTexels : UInt32

    /**
     * The depth in texels of the tile.
     */
    DepthInTexels : UInt32

}
