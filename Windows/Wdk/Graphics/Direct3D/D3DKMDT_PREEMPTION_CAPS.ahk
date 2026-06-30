#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY.ahk
#Include .\D3DKMDT_GRAPHICS_PREEMPTION_GRANULARITY.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_PREEMPTION_CAPS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3DKMDT_GRAPHICS_PREEMPTION_GRANULARITY}
     */
    GraphicsPreemptionGranularity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY}
     */
    ComputePreemptionGranularity {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
