#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the elements in a buffer resource to use in a render-target view.
 * @remarks
 * Use this structure with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure to view the resource as a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_rtv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BUFFER_RTV {
    #StructPack 8

    /**
     * Number of elements between the beginning of the buffer and the first element to access.
     */
    FirstElement : Int64

    /**
     * The total number of elements in the view.
     */
    NumElements : UInt32

}
