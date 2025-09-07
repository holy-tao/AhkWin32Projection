#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresources from a 3D texture to use in a render-target view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as a 3D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX3D_RTV extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The index of the mipmap level to use mip slice.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * First depth level to use.
     * @type {Integer}
     */
    FirstWSlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of depth levels to use in the render-target view, starting from <b>FirstWSlice</b>. A value of -1 indicates all of the slices along the w axis, starting from <b>FirstWSlice</b>.
     * @type {Integer}
     */
    WSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
