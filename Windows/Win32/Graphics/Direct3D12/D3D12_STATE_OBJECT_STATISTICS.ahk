#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_CREATE_STATE_OBJECT_STATISTICS.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STATE_OBJECT_STATISTICS extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    DefaultPSDBRegistered {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_CREATE_STATE_OBJECT_STATISTICS}
     */
    PipelineStateObjectStatistics {
        get {
            if(!this.HasProp("__PipelineStateObjectStatistics"))
                this.__PipelineStateObjectStatistics := D3D12_CREATE_STATE_OBJECT_STATISTICS(4, this)
            return this.__PipelineStateObjectStatistics
        }
    }

    /**
     * @type {D3D12_CREATE_STATE_OBJECT_STATISTICS}
     */
    StateObjectStatistics {
        get {
            if(!this.HasProp("__StateObjectStatistics"))
                this.__StateObjectStatistics := D3D12_CREATE_STATE_OBJECT_STATISTICS(20, this)
            return this.__StateObjectStatistics
        }
    }
}
