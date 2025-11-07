#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a tiled subresource volume.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourcetiling">GetResourceTiling</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_subresource_tiling
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SUBRESOURCE_TILING extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The width in tiles of the subresource.
     * @type {Integer}
     */
    WidthInTiles {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height in tiles of the subresource.
     * @type {Integer}
     */
    HeightInTiles {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The depth in tiles of the subresource.
     * @type {Integer}
     */
    DepthInTiles {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The index of the tile in the overall tiled subresource to start with.
     * @type {Integer}
     */
    StartTileIndexInOverallResource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
