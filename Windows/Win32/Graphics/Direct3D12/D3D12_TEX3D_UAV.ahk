#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a unordered-access 3D texture resource. (D3D12_TEX3D_UAV)
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure to view the resource as a 3D texture.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_uav
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX3D_UAV {
    #StructPack 4

    /**
     * The mipmap slice index.
     */
    MipSlice : UInt32

    /**
     * The zero-based index of the first depth slice to be accessed.
     */
    FirstWSlice : UInt32

    /**
     * The number of depth slices.
     * 
     * Set to -1 to indicate all the depth slices from <b>FirstWSlice</b> to the last slice.
     */
    WSize : UInt32

}
