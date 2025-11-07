#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the coordinates of a tiled resource.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytiles">CopyTiles</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-copytilemappings">CopyTileMappings</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-updatetilemappings">UpdateTileMappings</a> methods.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tiled_resource_coordinate
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TILED_RESOURCE_COORDINATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The x-coordinate of the tiled resource.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The y-coordinate of the tiled resource.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The z-coordinate of the tiled resource.
     * @type {Integer}
     */
    Z {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The index of the subresource for the tiled resource.
     * 
     * For mipmaps that use nonstandard tiling, or are packed, or both use nonstandard tiling and are packed, any subresource value that indicates any of the packed mipmaps all refer to the same tile. Additionally, the X coordinate is used to indicate a tile within the packed mip region, rather than a logical region of a single subresource. The Y and Z coordinates must be zero.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
