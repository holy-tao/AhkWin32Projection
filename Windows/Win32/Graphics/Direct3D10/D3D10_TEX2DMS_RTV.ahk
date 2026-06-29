#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource from a multisampled 2D texture to use in a render-target view. (D3D10_TEX2DMS_RTV)
 * @remarks
 * Since a multisampled 2D texture contains a single subresource, there is actually nothing to specify in <b>D3D10_TEX2DMS_RTV</b>. Consequently, <b>UnusedField_NothingToDefine</b> is included so that this structure will compile in C.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_tex2dms_rtv
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_TEX2DMS_RTV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Integer of any value. See remarks.
     */
    UnusedField_NothingToDefine : UInt32

}
