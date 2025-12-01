#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a tiled subresource volume. (D3D11_SUBRESOURCE_TILING)
 * @remarks
 * Each packed mipmap is individually reported as 0 for <b>WidthInTiles</b>, <b>HeightInTiles</b> and <b>DepthInTiles</b>.
 * 
 * 
 * The total number of tiles in subresources is <b>WidthInTiles</b>*<b>HeightInTiles</b>*<b>DepthInTiles</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_subresource_tiling
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SUBRESOURCE_TILING extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width in tiles of the subresource.
     * @type {Integer}
     */
    WidthInTiles {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT16</a></b>
     * 
     * The height in tiles of the subresource.
     * @type {Integer}
     */
    HeightInTiles {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT16</a></b>
     * 
     * The depth in tiles of the subresource.
     * @type {Integer}
     */
    DepthInTiles {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the tile in the overall tiled subresource to start with. 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/nf-d3d11_2-id3d11device2-getresourcetiling">GetResourceTiling</a> sets <b>StartTileIndexInOverallResource</b> to <b>D3D11_PACKED_TILE</b> (0xffffffff) to indicate that the whole 
     * <b>D3D11_SUBRESOURCE_TILING</b> structure is meaningless, and the info to which the <i>pPackedMipDesc</i> parameter of <b>GetResourceTiling</b> points applies. For packed tiles, the description of the packed mipmaps comes from a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc">D3D11_PACKED_MIP_DESC</a> structure instead.
     * @type {Integer}
     */
    StartTileIndexInOverallResource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
