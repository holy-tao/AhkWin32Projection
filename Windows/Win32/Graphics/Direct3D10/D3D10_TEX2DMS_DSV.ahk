#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource from a multisampled 2D texture that is accessible to a depth-stencil view. (D3D10_TEX2DMS_DSV)
 * @remarks
 * Since a multisampled 2D texture contains a single subtexture, there is nothing to specify; this unused member is included so that this structure will compile in C.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex2dms_dsv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEX2DMS_DSV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Unused.
     * @type {Integer}
     */
    UnusedField_NothingToDefine {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
