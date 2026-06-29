#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the subresource from a multisampled 2D texture that is accessible to a depth-stencil view. (D3D11_TEX2DMS_DSV)
 * @remarks
 * Because a multisampled 2D texture contains a single subtexture, there is nothing to specify; this unused member is included so that this structure will compile in C.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_dsv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2DMS_DSV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Unused.
     */
    UnusedField_NothingToDefine : UInt32

}
