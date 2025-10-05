#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresources from a multi sampled 2D texture to use in a shader-resource view.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc">D3D12_SHADER_RESOURCE_VIEW_DESC</a> structure.
  * 
  * Since a multi sampled 2D texture contains a single subresource, there is actually nothing to specify in <b>D3D12_TEX2DMS_SRV</b>. Consequently, <b>UnusedField_NothingToDefine</b> is included so that this structure will compile in C.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX2DMS_SRV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Integer of any value. See remarks.
     * @type {Integer}
     */
    UnusedField_NothingToDefine {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
