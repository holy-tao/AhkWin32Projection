#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies flags for raytracing geometry in a D3D12_RAYTRACING_GEOMETRY_DESC structure.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_raytracing_geometry_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_GEOMETRY_FLAGS extends Win32BitflagEnum{

    /**
     * No options specified.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_FLAG_NONE => 0

    /**
     * When rays encounter this geometry, the geometry acts as if no any hit shader is present.  It is recommended that apps use this flag liberally, as it can enable important ray-processing optimizations.  Note that this behavior can be overridden on a per-instance basis with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_instance_flags">D3D12_RAYTRACING_INSTANCE_FLAGS</a> and on a per-ray basis using ray flags in <b>TraceRay</b>.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE => 1

    /**
     * By default, the system is free to trigger an any hit shader more than once for a given ray-primitive intersection. This flexibility helps improve the traversal efficiency of acceleration structures in certain cases.  For instance, if the acceleration structure is implemented internally with bounding volumes, the implementation may find it beneficial to store relatively long triangles in multiple bounding boxes rather than a larger single box. However, some application use cases require that intersections be reported to the any hit shader at most once. This flag enables that guarantee for the given geometry, potentially with some performance impact.
     * 
     * This flag applies to all geometry types.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_FLAG_NO_DUPLICATE_ANYHIT_INVOCATION => 2
}
