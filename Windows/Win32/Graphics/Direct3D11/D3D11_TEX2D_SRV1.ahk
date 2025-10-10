#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresource from a 2D texture to use in a shader-resource view.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/ns-d3d11_3-d3d11_tex2d_srv1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX2D_SRV1 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Index of the most detailed mipmap level to use; this number is between 0 and (<b>MipLevels</b> (from the original Texture2D for which 
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>creates a view) - 1 ).
     * @type {Integer}
     */
    MostDetailedMip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of mipmap levels for the view of the texture. See the remarks in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_tex1d_srv">D3D11_TEX1D_SRV</a>.
     *             
     * 
     * Set to -1 to indicate all the mipmap levels from <b>MostDetailedMip</b> on down to least detailed.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The index (plane slice number) of the plane to use in the texture.
     * @type {Integer}
     */
    PlaneSlice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
