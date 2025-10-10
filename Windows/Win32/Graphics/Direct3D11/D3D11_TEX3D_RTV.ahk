#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresources from a 3D texture to use in a render-target view.
 * @remarks
 * 
  * This structure is one member of a render target view. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_tex3d_rtv
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEX3D_RTV extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the mipmap level to use mip slice.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * First depth level to use.
     * @type {Integer}
     */
    FirstWSlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of depth levels to use in the render-target view, starting from <b>FirstWSlice</b>. A value of -1 indicates all of the slices along the w axis, starting from <b>FirstWSlice</b>.
     * @type {Integer}
     */
    WSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
