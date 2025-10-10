#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the subresource from a multisampled 2D texture to use in a render-target view.
 * @remarks
 * 
  * Since a multisampled 2D texture contains a single subresource, there is actually nothing to specify in <b>D3D10_TEX2DMS_RTV</b>. Consequently, <b>UnusedField_NothingToDefine</b> is included so that this structure will compile in C.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_tex2dms_rtv
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEX2DMS_RTV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Integer of any value. See remarks.
     * @type {Integer}
     */
    UnusedField_NothingToDefine {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
