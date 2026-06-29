#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_NODE_OVERRIDES_TYPE.ahk" { D3D12_NODE_OVERRIDES_TYPE }
#Import ".\D3D12_THREAD_LAUNCH_OVERRIDES.ahk" { D3D12_THREAD_LAUNCH_OVERRIDES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_COMMON_COMPUTE_NODE_OVERRIDES.ahk" { D3D12_COMMON_COMPUTE_NODE_OVERRIDES }
#Import ".\D3D12_COALESCING_LAUNCH_OVERRIDES.ahk" { D3D12_COALESCING_LAUNCH_OVERRIDES }
#Import ".\D3D12_BROADCASTING_LAUNCH_OVERRIDES.ahk" { D3D12_BROADCASTING_LAUNCH_OVERRIDES }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_NODE {
    #StructPack 8

    Shader : PWSTR

    OverridesType : D3D12_NODE_OVERRIDES_TYPE

    pBroadcastingLaunchOverrides : D3D12_BROADCASTING_LAUNCH_OVERRIDES.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pCoalescingLaunchOverrides', { type: D3D12_COALESCING_LAUNCH_OVERRIDES.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pThreadLaunchOverrides', { type: D3D12_THREAD_LAUNCH_OVERRIDES.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pCommonComputeNodeOverrides', { type: D3D12_COMMON_COMPUTE_NODE_OVERRIDES.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
