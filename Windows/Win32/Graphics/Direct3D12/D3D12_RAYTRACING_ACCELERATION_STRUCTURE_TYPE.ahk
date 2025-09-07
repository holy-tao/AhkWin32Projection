#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a raytracing acceleration structure.
 * @remarks
 * Bottom-level acceleration structures each consist of a set of geometries that are building blocks for a scene. A top-level acceleration structure represents a set of instances of bottom-level acceleration structures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE{

    /**
     * Top-level acceleration structure.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_TOP_LEVEL => 0

    /**
     * Bottom-level acceleration structure.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_BOTTOM_LEVEL => 1
}
