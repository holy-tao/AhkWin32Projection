#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of a raytracing acceleration structure.
 * @remarks
 * Bottom-level acceleration structures each consist of a set of geometries that are building blocks for a scene. A top-level acceleration structure represents a set of instances of bottom-level acceleration structures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_ACCELERATION_STRUCTURE_TYPE_OPACITY_MICROMAP_ARRAY => 2
}
