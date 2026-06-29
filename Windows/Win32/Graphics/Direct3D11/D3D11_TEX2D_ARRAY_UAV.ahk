#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an array of unordered-access 2D texture resources. (D3D11_TEX2D_ARRAY_UAV)
 * @remarks
 * This structure is used by a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_uav
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX2D_ARRAY_UAV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The mipmap slice index.
     */
    MipSlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The zero-based index of the first array slice to be accessed.
     */
    FirstArraySlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slices in the array.
     */
    ArraySize : UInt32

}
