#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresources from an array of multi sampled 2D textures to use in a render-target view.
 * @remarks
 * 
  * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as an array of multi sampled 2D textures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tex2dms_array_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX2DMS_ARRAY_RTV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The index of the first texture to use in an array of textures.
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of textures to use.
     * @type {Integer}
     */
    ArraySize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
