#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the shape of a tile by specifying its dimensions. (D3D11_TILE_SHAPE)
 * @remarks
 * Texels are equivalent to pixels.  For untyped buffer resources, a texel is just a byte. For multisample antialiasing (MSAA) surfaces, the numbers are still in terms of pixels/texels.
 * The values here are independent of the surface dimensions.  Even if the surface is smaller than what would fit in a tile, the full tile dimensions are reported here.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tile_shape
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TILE_SHAPE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width in texels of the tile.
     * @type {Integer}
     */
    WidthInTexels {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height in texels of the tile.
     * @type {Integer}
     */
    HeightInTexels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The depth in texels of the tile.
     * @type {Integer}
     */
    DepthInTexels {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
