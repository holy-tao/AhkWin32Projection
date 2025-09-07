#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource(s) from a 3D texture to use in a shader-resource view.
 * @remarks
 * This structure is one member of a shader-resource-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc">D3D10_SHADER_RESOURCE_VIEW_DESC</a>).
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex3d_srv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEX3D_SRV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the most detailed mipmap level to use; this number is between 0 and <b>MipLevels</b> -1.
     * @type {Integer}
     */
    MostDetailedMip {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of mipmap levels to use.
     * @type {Integer}
     */
    MipLevels {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
