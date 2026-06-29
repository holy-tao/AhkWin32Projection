#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the subresource from a multi sampled 2D texture that is accessible to a depth-stencil view.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc">D3D12_DEPTH_STENCIL_VIEW_DESC</a> structure.
 * 
 * Because a multi sampled 2D texture contains a single subresource, there is nothing to specify in <b>D3D12_TEX2DMS_DSV</b>. Consequently, <b>UnusedField_NothingToDefine</b> is included so that this structure will compile in C.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_dsv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX2DMS_DSV {
    #StructPack 4

    /**
     * Unused.
     */
    UnusedField_NothingToDefine : UInt32

}
