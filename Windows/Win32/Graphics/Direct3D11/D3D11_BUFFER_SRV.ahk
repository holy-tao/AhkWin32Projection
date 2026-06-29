#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the elements in a buffer resource to use in a shader-resource view. (D3D11_BUFFER_SRV)
 * @remarks
 * The <b>D3D11_BUFFER_SRV</b> structure is a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc">D3D11_SHADER_RESOURCE_VIEW_DESC</a> structure, which represents a shader-resource view description. You can create a shader-resource view by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createshaderresourceview">ID3D11Device::CreateShaderResourceView</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_srv
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_BUFFER_SRV {
    #StructPack 4

    FirstElement : UInt32

    NumElements : UInt32

    static __New() {
        DefineProp(this.Prototype, 'ElementOffset', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'ElementWidth', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
