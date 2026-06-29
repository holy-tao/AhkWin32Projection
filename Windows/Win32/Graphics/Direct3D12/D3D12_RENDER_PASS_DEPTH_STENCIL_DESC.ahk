#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS }
#Import ".\D3D12_CPU_DESCRIPTOR_HANDLE.ahk" { D3D12_CPU_DESCRIPTOR_HANDLE }
#Import ".\D3D12_DEPTH_STENCIL_VALUE.ahk" { D3D12_DEPTH_STENCIL_VALUE }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS }
#Import ".\D3D12_RESOLVE_MODE.ahk" { D3D12_RESOLVE_MODE }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS_TYPE }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_TYPE.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_TYPE }
#Import ".\D3D12_CLEAR_VALUE.ahk" { D3D12_CLEAR_VALUE }
#Import ".\D3D12_RENDER_PASS_BEGINNING_ACCESS.ahk" { D3D12_RENDER_PASS_BEGINNING_ACCESS }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }
#Import ".\D3D12_RENDER_PASS_ENDING_ACCESS.ahk" { D3D12_RENDER_PASS_ENDING_ACCESS }

/**
 * Describes a binding (fixed for the duration of the render pass) to a depth stencil view (DSV), as well as its beginning and ending access characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_depth_stencil_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_PASS_DEPTH_STENCIL_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>. The CPU descriptor handle corresponding to the depth stencil view (DSV).
     */
    cpuDescriptor : D3D12_CPU_DESCRIPTOR_HANDLE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access">D3D12_RENDER_PASS_BEGINNING_ACCESS</a>. The access to the depth buffer requested at the transition into a render pass.
     */
    DepthBeginningAccess : D3D12_RENDER_PASS_BEGINNING_ACCESS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access">D3D12_RENDER_PASS_BEGINNING_ACCESS</a>. The access to the stencil buffer requested at the transition into a render pass.
     */
    StencilBeginningAccess : D3D12_RENDER_PASS_BEGINNING_ACCESS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access">D3D12_RENDER_PASS_ENDING_ACCESS</a>. The access to the depth buffer requested at the transition out of a render pass.
     */
    DepthEndingAccess : D3D12_RENDER_PASS_ENDING_ACCESS

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access">D3D12_RENDER_PASS_ENDING_ACCESS</a>. The access to the stencil buffer requested at the transition out of a render pass.
     */
    StencilEndingAccess : D3D12_RENDER_PASS_ENDING_ACCESS

}
