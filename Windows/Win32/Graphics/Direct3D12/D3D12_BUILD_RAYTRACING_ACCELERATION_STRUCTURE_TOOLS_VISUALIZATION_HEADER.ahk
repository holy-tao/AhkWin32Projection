#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE.ahk" { D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE }

/**
 * Describes the GPU memory layout of an acceleration structure visualization.
 * @remarks
 * This structure functions like the inverse of the inputs to an acceleration structure build, focused on the instance or geometry details, depending on the acceleration structure type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_tools_visualization_header
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_TOOLS_VISUALIZATION_HEADER {
    #StructPack 4

    /**
     * The type of acceleration structure.
     */
    Type : D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE

    /**
     * The number of descriptions.
     */
    NumDescs : UInt32

}
