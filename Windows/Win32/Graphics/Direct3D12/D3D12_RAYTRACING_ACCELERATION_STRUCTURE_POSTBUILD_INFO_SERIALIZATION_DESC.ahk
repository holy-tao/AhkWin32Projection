#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the size and layout of the serialized acceleration structure and header.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_serialization_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC {
    #StructPack 8

    /**
     * The size of the serialized acceleration structure, including a header.  The header is <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_raytracing_acceleration_structure_header">D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER</a> followed by followed by a list of pointers to bottom-level acceleration structures.
     */
    SerializedSizeInBytes : Int64

    NumBottomLevelAccelerationStructurePointers : Int64

    static __New() {
        DefineProp(this.Prototype, 'NumBottomLevelAccelerationStructureHeaderAndPointerListPairs', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
