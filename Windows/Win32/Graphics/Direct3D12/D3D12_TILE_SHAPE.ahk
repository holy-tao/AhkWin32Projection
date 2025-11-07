#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the shape of a tile by specifying its dimensions.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getresourcetiling">GetResourceTiling</a>     method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tile_shape
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TILE_SHAPE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The width in texels of the tile.
     * @type {Integer}
     */
    WidthInTexels {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height in texels of the tile.
     * @type {Integer}
     */
    HeightInTexels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The depth in texels of the tile.
     * @type {Integer}
     */
    DepthInTexels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
