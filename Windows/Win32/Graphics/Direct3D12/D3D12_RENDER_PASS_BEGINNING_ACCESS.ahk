#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEPTH_STENCIL_VALUE.ahk" { D3D12_DEPTH_STENCIL_VALUE }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE }
#Import ".\D3D12_CLEAR_VALUE.ahk" { D3D12_CLEAR_VALUE }

/**
 * Describes the access to resource(s) that is requested by an application at the transition into a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_PASS_BEGINNING_ACCESS {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_beginning_access_type">D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE</a>. The type of access being requested.
     */
    Type : D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE

    Clear : D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS

    static __New() {
        DefineProp(this.Prototype, 'PreserveLocal', { type: D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS, offset: 4 })
        this.DeleteProp("__New")
    }
}
