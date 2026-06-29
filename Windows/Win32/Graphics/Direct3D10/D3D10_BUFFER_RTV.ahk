#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the elements from a buffer resource to use in a render-target view.
 * @remarks
 * A render-target view is a member of a render-target-view description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a>). Create a render-target view by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_buffer_rtv
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_BUFFER_RTV {
    #StructPack 4

    FirstElement : UInt32

    NumElements : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ElementOffset', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'ElementWidth', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
