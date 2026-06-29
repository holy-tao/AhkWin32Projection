#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the elements in a raw buffer resource to use in a shader-resource view.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a> to create a raw view of a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_bufferex_srv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_BUFFEREX_SRV {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first element to be accessed by the view.
     */
    FirstElement : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in the resource.
     */
    NumElements : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bufferex_srv_flag">D3D11_BUFFEREX_SRV_FLAG</a>-typed value that identifies view options for the buffer. Currently, the only option is to identify a raw view of the buffer. For more info about raw viewing of buffers, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-resources-intro">Raw Views of Buffers</a>.
     */
    Flags : UInt32

}
