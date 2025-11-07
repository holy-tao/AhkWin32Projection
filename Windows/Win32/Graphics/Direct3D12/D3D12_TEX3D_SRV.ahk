#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresources from a 3D texture to use in a shader-resource view.
 * @remarks
 * 
 * This structure is one member of a shader-resource-view description, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tex3d_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX3D_SRV extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Index of the most detailed mipmap level to use; this number is between 0 and <b>MipLevels</b> (from the original Texture3D for which <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> creates a view) -1.
     * @type {Integer}
     */
    MostDetailedMip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of mipmap levels for the view of the texture. See the remarks in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_tex1d_srv">D3D12_TEX1D_SRV</a>.
     * 
     * Set to -1 to indicate all the mipmap levels from <b>MostDetailedMip</b> on down to least detailed.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value to clamp sample LOD values to. For example, if you specify 2.0f for the clamp value, you ensure that no individual sample accesses a mip level less than 2.0f.
     * @type {Float}
     */
    ResourceMinLODClamp {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
