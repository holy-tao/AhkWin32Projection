#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE.ahk" { D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE }
#Import ".\D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_DESC.ahk" { D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_DESC }
#Import ".\D3D12_RAYTRACING_GEOMETRY_DESC.ahk" { D3D12_RAYTRACING_GEOMETRY_DESC }
#Import ".\D3D12_ELEMENTS_LAYOUT.ahk" { D3D12_ELEMENTS_LAYOUT }
#Import ".\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS.ahk" { D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS }

/**
 * Defines the inputs for a raytracing acceleration structure build operation. This structure is used by ID3D12GraphicsCommandList4::BuildRaytracingAccelerationStructure and ID3D12Device5::GetRaytracingAccelerationStructurePrebuildInfo.
 * @remarks
 * When used with  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo">GetRaytracingAccelerationStructurePrebuildInfo</a>, which actually perform a build, any parameter that is referenced via <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12_gpu_virtual_address">D3D12_GPU_VIRTUAL_ADDRESS</a> (an address in GPU memory), like <i>InstanceDescs</i>, will not be accessed by the operation.  So this memory does not need to be initialized yet or be in a particular resource state.  Whether GPU addresses are null or not can be inspected by the operation, even though the pointers are not dereferenced.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_inputs
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS {
    #StructPack 8

    /**
     * The type of acceleration structure to build.
     */
    Type : D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE

    /**
     * The build flags.
     */
    Flags : D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS

    /**
     * If <i>Type</i> is <b>D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TOP_LEVEL</b>, this value is the number of instances, laid out based on <i>DescsLayout</i>.
     * 
     * If <i>Type</i> is <b>D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BOTTOM_LEVEL</b>, this value is the number of elements referred to by <i>pGeometryDescs</i> or <i>ppGeometryDescs</i>. Which of these fields  is used depends on <i>DescsLayout</i>.
     */
    NumDescs : UInt32

    /**
     * How geometry descriptions are specified; either an array of descriptions or an array of pointers to descriptions.
     */
    DescsLayout : D3D12_ELEMENTS_LAYOUT

    InstanceDescs : Int64

    static __New() {
        DefineProp(this.Prototype, 'pGeometryDescs', { type: D3D12_RAYTRACING_GEOMETRY_DESC.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'ppGeometryDescs', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'pOpacityMicromapArrayDesc', { type: D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_DESC.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
