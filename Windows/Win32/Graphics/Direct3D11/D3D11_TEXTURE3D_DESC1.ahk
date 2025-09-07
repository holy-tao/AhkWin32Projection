#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a 3D texture. (D3D11_TEXTURE3D_DESC1)
 * @remarks
 * This structure is used in a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createtexture3d1">ID3D11Device3::CreateTexture3D1</a>.
  * 
  * In addition to this structure, you can also use the <b>CD3D11_TEXTURE3D_DESC1</b> derived structure, which is defined  in D3D11_3.h and behaves like an inherited class, to help create a texture description.
  * 
  * The device restricts the size of subsampled, block compressed, and bit format resources to be multiples of sizes specific to each format.
  * 
  * The texture size range is determined by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> at which you create the device and not the Microsoft Direct3D interface version. For example, if you use Microsoft Direct3D 10 hardware at feature level 10 (<a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL_10_0</a>) and call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> to create an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>, you must constrain the maximum texture size to D3D10_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048) when you create your 3D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_texture3d_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEXTURE3D_DESC1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Texture width (in texels). The  range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048). However, the range is actually constrained by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> at which you create the rendering device. For more information about restrictions, see Remarks.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Texture height (in texels). The  range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048). However, the range is actually constrained by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> at which you create the rendering device. For more information about restrictions, see Remarks.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Texture depth (in texels). The  range is from 1 to D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION (2048). However, the range is actually constrained by the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> at which you create the rendering device. For more information about restrictions, see Remarks.
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum number of mipmap levels in the texture. See the remarks in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_tex1d_srv">D3D11_TEX1D_SRV</a>. Use 1 for a multisampled texture; or 0 to generate a full set of subtextures.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Texture format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Value that identifies how the texture is to be read from and written to. The most common value is D3D11_USAGE_DEFAULT; see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a> for all possible values.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a>) for binding to pipeline stages. The flags can be combined by a bitwise OR.
     * @type {Integer}
     */
    BindFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_cpu_access_flag">D3D11_CPU_ACCESS_FLAG</a>) to specify the types of CPU access allowed. Use 0 if CPU access is not required. These flags can be combined with a bitwise OR.
     * @type {Integer}
     */
    CPUAccessFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a>) that identify other, less common resource options. Use 0 if none of these flags apply. These flags can be combined with a bitwise OR.
     * @type {Integer}
     */
    MiscFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_texture_layout">D3D11_TEXTURE_LAYOUT</a>-typed value that identifies the layout of the texture.
     * 
     * The TextureLayout parameter selects both the actual layout of the texture in memory and the layout visible to the application while the texture is mapped.  These flags may not be requested without CPU access also requested.
     * 
     * It is illegal to set CPU access flags on default textures without also setting Layout to a value other than D3D11_TEXTURE_LAYOUT_UNDEFINED.
     * 
     * D3D11_TEXTURE_LAYOUT_ROW_MAJOR may not be used with 3D textures.  D3D11_TEXTURE_LAYOUT_64K_STANDARD_SWIZZLE may not be used with 3D textures that have mipmaps.
     * @type {Integer}
     */
    TextureLayout {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
