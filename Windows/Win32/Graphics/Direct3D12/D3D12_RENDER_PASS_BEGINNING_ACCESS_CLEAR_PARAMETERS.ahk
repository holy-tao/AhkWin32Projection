#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEPTH_STENCIL_VALUE.ahk" { D3D12_DEPTH_STENCIL_VALUE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_CLEAR_VALUE.ahk" { D3D12_CLEAR_VALUE }

/**
 * Describes the clear value to which resource(s) should be cleared at the beginning of a render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access_clear_parameters
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS {
    #StructPack 4

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_clear_value">D3D12_CLEAR_VALUE</a>. The clear value to which the resource(s) should be cleared.
     */
    ClearValue : D3D12_CLEAR_VALUE

}
