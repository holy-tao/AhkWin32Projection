#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the coordinates of a tiled resource. (D3D11_TILED_RESOURCE_COORDINATE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TILED_RESOURCE_COORDINATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The x position of a tiled resource. Used for buffer and 1D, 2D, and 3D textures.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The y position of a tiled resource. Used for 2D and 3D textures.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The z position of a tiled resource. Used for 3D textures.
     * @type {Integer}
     */
    Z {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A subresource index value into mipmaps and arrays. Used for 1D, 2D, and 3D textures. 
     * 
     * For mipmaps that use nonstandard tiling, or are packed, or both use nonstandard tiling and are packed, any subresource value that indicates any of the packed mipmaps all refer to the same tile.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
