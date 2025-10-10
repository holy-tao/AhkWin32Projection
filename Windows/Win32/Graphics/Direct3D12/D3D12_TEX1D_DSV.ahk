#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the subresource from a 1D texture that is accessible to a depth-stencil view.
 * @remarks
 * 
  * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure to view the resource as a 1D texture.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tex1d_dsv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX1D_DSV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The index of the first mipmap level to use.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
