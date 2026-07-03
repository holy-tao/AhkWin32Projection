#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.ahk" { D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER }

/**
 * Defines the header for a serialized raytracing acceleration structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_serialized_raytracing_acceleration_structure_header
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER {
    #StructPack 8

    /**
     * The driver-matching identifier.
     */
    DriverMatchingIdentifier : D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER

    /**
     * The size of serialized data.
     */
    SerializedSizeInBytesIncludingHeader : Int64

    /**
     * Size of the memory that will be consumed when the acceleration structure is deserialized.  This value is less than or equal to the size of the original acceleration structure before it was serialized.
     */
    DeserializedSizeInBytes : Int64

    /**
     * Size of the array of <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12_gpu_virtual_address">D3D12_GPU_VIRTUAL_ADDRESS</a> values that follow the header.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_serialization_desc">D3D12_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC</a>.
     */
    NumBottomLevelAccelerationStructurePointersAfterHeader : Int64

}
