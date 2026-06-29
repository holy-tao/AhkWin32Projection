#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the coordinates of a tiled resource. (D3D11_TILED_RESOURCE_COORDINATE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TILED_RESOURCE_COORDINATE {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of a tiled resource. Used for buffer and 1D, 2D, and 3D textures.
     */
    X : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of a tiled resource. Used for 2D and 3D textures.
     */
    Y : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of a tiled resource. Used for 3D textures.
     */
    Z : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A subresource index value into mipmaps and arrays. Used for 1D, 2D, and 3D textures. 
     * 
     * For mipmaps that use nonstandard tiling, or are packed, or both use nonstandard tiling and are packed, any subresource value that indicates any of the packed mipmaps all refer to the same tile.
     */
    Subresource : UInt32

}
