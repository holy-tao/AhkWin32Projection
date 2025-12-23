#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_CPU_DESCRIPTOR_HANDLE.ahk
#Include .\D3D12_DEPTH_STENCIL_VALUE.ahk
#Include .\D3D12_CLEAR_VALUE.ahk
#Include .\D3D12_RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS.ahk
#Include .\D3D12_RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk
#Include .\D3D12_RENDER_PASS_BEGINNING_ACCESS.ahk
#Include .\D3D12_RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS.ahk
#Include .\D3D12_RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS.ahk
#Include .\D3D12_RENDER_PASS_ENDING_ACCESS.ahk

/**
 * Describes bindings (fixed for the duration of the render pass) to one or more render target views (RTVs), as well as their beginning and ending access characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_render_target_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_RENDER_TARGET_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a>. The CPU descriptor handle corresponding to the render target view(s) (RTVs).
     * @type {D3D12_CPU_DESCRIPTOR_HANDLE}
     */
    cpuDescriptor{
        get {
            if(!this.HasProp("__cpuDescriptor"))
                this.__cpuDescriptor := D3D12_CPU_DESCRIPTOR_HANDLE(0, this)
            return this.__cpuDescriptor
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access">D3D12_RENDER_PASS_BEGINNING_ACCESS</a>. The access to the RTV(s) requested at the transition into a render pass.
     * @type {D3D12_RENDER_PASS_BEGINNING_ACCESS}
     */
    BeginningAccess{
        get {
            if(!this.HasProp("__BeginningAccess"))
                this.__BeginningAccess := D3D12_RENDER_PASS_BEGINNING_ACCESS(8, this)
            return this.__BeginningAccess
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access">D3D12_RENDER_PASS_ENDING_ACCESS</a>. The access to the RTV(s) requested at the transition out of a render pass.
     * @type {D3D12_RENDER_PASS_ENDING_ACCESS}
     */
    EndingAccess{
        get {
            if(!this.HasProp("__EndingAccess"))
                this.__EndingAccess := D3D12_RENDER_PASS_ENDING_ACCESS(32, this)
            return this.__EndingAccess
        }
    }
}
