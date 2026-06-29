#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents prebuild information about a raytracing acceleration structure. Get an instance of this structure by calling GetRaytracingAccelerationStructurePrebuildInfo.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_prebuild_info
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO {
    #StructPack 8

    /**
     * Size required to hold the result of an acceleration structure build based on the specified inputs.
     */
    ResultDataMaxSizeInBytes : Int64

    /**
     * Scratch storage on the GPU required during acceleration structure build based on the specified inputs.
     */
    ScratchDataSizeInBytes : Int64

    UpdateScratchDataSizeInBytes : Int64

}
