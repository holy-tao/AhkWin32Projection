#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource(s) from an array of multisampled 2D textures to use in a shader-resource view.
 * @remarks
 * This structure is one member of a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex2dms_array_srv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEX2DMS_ARRAY_SRV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first texture to use in an array of textures (see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">array slice</a>)
     * @type {Integer}
     */
    FirstArraySlice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of textures to use.
     * @type {Integer}
     */
    ArraySize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
