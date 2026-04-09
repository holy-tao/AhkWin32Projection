#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_NODE_OVERRIDES_TYPE.ahk
#Include .\D3D12_BROADCASTING_LAUNCH_OVERRIDES.ahk
#Include .\D3D12_COALESCING_LAUNCH_OVERRIDES.ahk
#Include .\D3D12_THREAD_LAUNCH_OVERRIDES.ahk
#Include .\D3D12_COMMON_COMPUTE_NODE_OVERRIDES.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SHADER_NODE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Shader {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {D3D12_NODE_OVERRIDES_TYPE}
     */
    OverridesType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_BROADCASTING_LAUNCH_OVERRIDES>}
     */
    pBroadcastingLaunchOverrides {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3D12_COALESCING_LAUNCH_OVERRIDES>}
     */
    pCoalescingLaunchOverrides {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3D12_THREAD_LAUNCH_OVERRIDES>}
     */
    pThreadLaunchOverrides {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3D12_COMMON_COMPUTE_NODE_OVERRIDES>}
     */
    pCommonComputeNodeOverrides {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
