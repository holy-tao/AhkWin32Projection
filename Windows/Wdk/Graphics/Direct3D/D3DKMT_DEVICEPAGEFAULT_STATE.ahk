#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXGK_PAGE_FAULT_FLAGS.ahk
#Include .\DXGK_RENDER_PIPELINE_STAGE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICEPAGEFAULT_STATE extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FaultedPrimitiveAPISequenceNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DXGK_RENDER_PIPELINE_STAGE}
     */
    FaultedPipelineStage {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FaultedBindTableEntry {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {DXGK_PAGE_FAULT_FLAGS}
     */
    PageFaultFlags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    FaultErrorCode {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    FaultedVirtualAddress {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
