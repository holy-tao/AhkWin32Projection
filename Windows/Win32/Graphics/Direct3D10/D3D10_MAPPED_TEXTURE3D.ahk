#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides access to subresource data in a 3D texture.
 * @remarks
 * This structure is used to access subresource data when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10texture3d-map">ID3D10Texture3D::Map</a>. To access data, you must cast the <b>pData</b> pointer; see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_mapped_texture2d">D3D10_MAPPED_TEXTURE2D</a> for an example.
 * 
 * To illustrate pitch for an uncompressed texture, assume a 3D texture with mipmap levels, as shown in the following illustration.
 * 
 * <img alt="Illustration of a 3D texture with mipmap levels" src="./images/d3d10_resource_texture3d.png"/>
 * 
 * It is easiest to consider the top-level texture only, as shown in the following illustration.
 * 
 * <img alt="Illustration of only the top-level texture" src="./images/d3d10_3d_texture_1.png"/>
 * 
 * And then visualize the top-level texture redrawn as a series of 2D textures, each one having a different depth value. This yields several texture planes, as shown in the following illustration.
 * 
 * <img alt="Illustration of top-level texture drawn as 2D texture planes" src="./images/d3d10_3d_texture_conceptual.png"/>
 * 
 * However, the actual layout of all the elements from all the texture planes looks more like the following illustration.
 * 
 * <img alt="Illustration of the row pitch and depth pitch in memory" src="./images/d3d10_3d_texture_memory.png"/>
 * 
 * Use row pitch to advance a pointer between rows within a single 2D texture plane; use depth pitch to advance a pointer between 2D texture planes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_mapped_texture3d
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MAPPED_TEXTURE3D extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>void*</b>
     * 
     * Pointer to the data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The pitch, or width, or physical size (in bytes) of one row of an uncompressed texture. Since a block-compressed texture is encoded in 4x4 blocks, the <b>RowPitch</b> for a compressed texture is the number of bytes in a block of 4x4 texels. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-block-compression">virtual size vs physical size</a> for more information on block compression.
     * @type {Integer}
     */
    RowPitch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The pitch or number of bytes in all rows for a single depth.
     * @type {Integer}
     */
    DepthPitch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
