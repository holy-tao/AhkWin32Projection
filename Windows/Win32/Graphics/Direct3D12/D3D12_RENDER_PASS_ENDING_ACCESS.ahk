#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS }
#Import ".\D3D12_RESOLVE_MODE.ahk" { D3D12_RESOLVE_MODE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_TYPE.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_TYPE }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Describes the access to resource(s) that is requested by an application at the transition out of a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_PASS_ENDING_ACCESS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_render_pass_ending_access_type">D3D12_RENDER_PASS_ENDING_ACCESS_TYPE</a>. The type of access being requested.
     */
    Type : D3D12_RENDER_PASS_ENDING_ACCESS_TYPE

    Resolve : D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS

    static __New() {
        DefineProp(this.Prototype, 'PreserveLocal', { type: D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS, offset: 8 })
        this.DeleteProp("__New")
    }
}
