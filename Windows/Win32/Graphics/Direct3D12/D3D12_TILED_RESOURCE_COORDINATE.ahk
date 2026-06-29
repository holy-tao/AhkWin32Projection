#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the coordinates of a tiled resource. (D3D12_TILED_RESOURCE_COORDINATE)
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles">CopyTiles</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings">CopyTileMappings</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">UpdateTileMappings</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TILED_RESOURCE_COORDINATE {
    #StructPack 4

    /**
     * The x-coordinate of the tiled resource.
     */
    X : UInt32

    /**
     * The y-coordinate of the tiled resource.
     */
    Y : UInt32

    /**
     * The z-coordinate of the tiled resource.
     */
    Z : UInt32

    /**
     * The index of the subresource for the tiled resource.
     * 
     * For mipmaps that use nonstandard tiling, or are packed, or both use nonstandard tiling and are packed, any subresource value that indicates any of the packed mipmaps all refer to the same tile. Additionally, the X coordinate is used to indicate a tile within the packed mip region, rather than a logical region of a single subresource. The Y and Z coordinates must be zero.
     */
    Subresource : UInt32

}
