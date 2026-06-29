#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an array of unordered-access 1D texture resources. (D3D12_TEX1D_ARRAY_UAV)
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc">D3D12_UNORDERED_ACCESS_VIEW_DESC</a> structure to view the resource as an array of 1D textures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_array_uav
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEX1D_ARRAY_UAV {
    #StructPack 4

    /**
     * The mipmap slice index.
     */
    MipSlice : UInt32

    /**
     * The zero-based index of the first array slice to be accessed.
     */
    FirstArraySlice : UInt32

    /**
     * The number of slices in the array.
     */
    ArraySize : UInt32

}
