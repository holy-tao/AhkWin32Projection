#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SET_WORK_GRAPH_DESC.ahk" { D3D12_SET_WORK_GRAPH_DESC }
#Import ".\D3D12_PROGRAM_TYPE.ahk" { D3D12_PROGRAM_TYPE }
#Import ".\D3D12_SET_RAYTRACING_PIPELINE_DESC.ahk" { D3D12_SET_RAYTRACING_PIPELINE_DESC }
#Import ".\D3D12_PROGRAM_IDENTIFIER.ahk" { D3D12_PROGRAM_IDENTIFIER }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE }
#Import ".\D3D12_SET_WORK_GRAPH_FLAGS.ahk" { D3D12_SET_WORK_GRAPH_FLAGS }
#Import ".\D3D12_SET_GENERIC_PIPELINE_DESC.ahk" { D3D12_SET_GENERIC_PIPELINE_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SET_PROGRAM_DESC {
    #StructPack 8

    Type : D3D12_PROGRAM_TYPE

    GenericPipeline : D3D12_SET_GENERIC_PIPELINE_DESC

    static __New() {
        DefineProp(this.Prototype, 'RaytracingPipeline', { type: D3D12_SET_RAYTRACING_PIPELINE_DESC, offset: 8 })
        DefineProp(this.Prototype, 'WorkGraph', { type: D3D12_SET_WORK_GRAPH_DESC, offset: 8 })
        this.DeleteProp("__New")
    }
}
