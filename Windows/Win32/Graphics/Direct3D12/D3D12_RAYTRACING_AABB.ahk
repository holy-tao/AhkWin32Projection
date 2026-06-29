#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an axis-aligned bounding box (AABB) used as raytracing geometry.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_aabb
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_AABB {
    #StructPack 4

    /**
     * The minimum X coordinate of the box.
     */
    MinX : Float32

    /**
     * The minimum Y coordinate of the box.
     */
    MinY : Float32

    /**
     * The minimum Z coordinate of the box.
     */
    MinZ : Float32

    /**
     * The maximum X coordinate of the box.
     */
    MaxX : Float32

    /**
     * The maximum Y coordinate of the box.
     */
    MaxY : Float32

    /**
     * The maximum Z coordinate of the box.
     */
    MaxZ : Float32

}
