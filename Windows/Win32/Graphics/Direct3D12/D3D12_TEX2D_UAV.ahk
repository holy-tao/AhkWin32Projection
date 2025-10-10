#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a unordered-access 2D texture resource.
 * @remarks
 * 
  * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure to view the resource as a 2D texture.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_tex2d_uav
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEX2D_UAV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The mipmap slice index.
     * @type {Integer}
     */
    MipSlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index (plane slice number) of the plane to use in the texture.
     * @type {Integer}
     */
    PlaneSlice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
