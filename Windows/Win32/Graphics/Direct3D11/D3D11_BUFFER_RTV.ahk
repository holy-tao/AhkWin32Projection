#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the elements in a buffer resource to use in a render-target view.
 * @remarks
 * A render-target view is a member of a render-target-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a>). Create a render-target view by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrendertargetview">ID3D11Device::CreateRenderTargetView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_rtv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_BUFFER_RTV {
    #StructPack 4

    FirstElement : UInt32

    NumElements : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ElementOffset', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'ElementWidth', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
