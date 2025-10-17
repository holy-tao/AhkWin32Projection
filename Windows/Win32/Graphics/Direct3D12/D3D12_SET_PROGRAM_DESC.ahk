#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_PROGRAM_IDENTIFIER.ahk
#Include .\D3D12_SET_GENERIC_PIPELINE_DESC.ahk
#Include .\D3D12_SET_RAYTRACING_PIPELINE_DESC.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE.ahk
#Include .\D3D12_SET_WORK_GRAPH_DESC.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SET_PROGRAM_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_SET_GENERIC_PIPELINE_DESC}
     */
    GenericPipeline{
        get {
            if(!this.HasProp("__GenericPipeline"))
                this.__GenericPipeline := D3D12_SET_GENERIC_PIPELINE_DESC(8, this)
            return this.__GenericPipeline
        }
    }

    /**
     * @type {D3D12_SET_RAYTRACING_PIPELINE_DESC}
     */
    RaytracingPipeline{
        get {
            if(!this.HasProp("__RaytracingPipeline"))
                this.__RaytracingPipeline := D3D12_SET_RAYTRACING_PIPELINE_DESC(8, this)
            return this.__RaytracingPipeline
        }
    }

    /**
     * @type {D3D12_SET_WORK_GRAPH_DESC}
     */
    WorkGraph{
        get {
            if(!this.HasProp("__WorkGraph"))
                this.__WorkGraph := D3D12_SET_WORK_GRAPH_DESC(8, this)
            return this.__WorkGraph
        }
    }
}
