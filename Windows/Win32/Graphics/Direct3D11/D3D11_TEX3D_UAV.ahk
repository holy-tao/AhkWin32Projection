#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a unordered-access 3D texture resource. (D3D11_TEX3D_UAV)
 * @remarks
 * This structure is used by a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc">D3D11_UNORDERED_ACCESS_VIEW_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex3d_uav
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_TEX3D_UAV {
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
     * The zero-based index of the first depth slice to be accessed.
     */
    FirstWSlice : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of depth slices.
     */
    WSize : UInt32

}
