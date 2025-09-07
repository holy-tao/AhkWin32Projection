#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource from a 1D texture to use in a shader-resource view. (D3D12_TEX1D_SRV)
 * @remarks
 * This structure is one member of a shader-resource-view description, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>.
  * 
  * As an example, assuming <b>MostDetailedMip</b> = 6 and <b>MipLevels</b> = 2, the view will have access to 2 mipmap levels, 6 and 7, of the original texture for which <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> creates the view. In this situation, <b>MostDetailedMip</b> is greater than the <b>MipLevels</b> in the view. However, <b>MostDetailedMip</b> is not greater than the <b>MipLevels</b> in the original resource.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX1D_SRV extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Index of the most detailed mipmap level to use; this number is between 0 and <b>MipLevels</b> (from the original Texture1D for which <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> creates a view) -1.
     * @type {Integer}
     */
    MostDetailedMip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of mipmap levels for the view  of the texture. See the remarks.
     * 
     * Set to -1 to indicate all the mipmap levels from <b>MostDetailedMip</b> on down to least detailed.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the minimum mipmap level that you can access. Specifying 0.0f means that you can access all of the mipmap levels. Specifying 3.0f means that you can access mipmap levels from 3.0f to *MipCount - 1*.
     * 
     * We recommend that you don't set *MostDetailedMip* and *ResourceMinLODClamp* at the same time. Instead, set one of those two members to 0 (to get default behavior). That's because *MipLevels* is interpreted differently in conjunction with different fields:
     * * For *MostDetailedMip*, mips are in the range \[*MostDetailedMip*, *MostDetailedMip* + *MipLevels* - 1].
     * * For *ResourceMinLODClamp*, mips are in the range \[*ResourceMinLODClamp*, *MipLevels* - 1].
     * @type {Float}
     */
    ResourceMinLODClamp {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
