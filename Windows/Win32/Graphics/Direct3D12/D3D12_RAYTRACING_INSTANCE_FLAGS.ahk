#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for a raytracing acceleration structure instance. These flags can be used to override D3D12_RAYTRACING_GEOMETRY_FLAGS for individual instances.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_instance_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_INSTANCE_FLAGS{

    /**
     * No options specified.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_INSTANCE_FLAG_NONE => 0

    /**
     * Disables front/back face culling for this instance.  The Ray flags <b>RAY_FLAG_CULL_BACK_FACING_TRIANGLES</b> and <b>RAY_FLAG_CULL_FRONT_FACING_TRIANGLES</b> will have no effect on this instance.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_CULL_DISABLE => 1

    /**
     * This flag reverses front and back facings, which is useful if the application’s natural winding order differs from the default. By default, a triangle is front facing if its vertices appear clockwise from the ray origin and back facing if its vertices appear counter-clockwise from the ray origin, in object space in a left-handed coordinate system.  
 * 
 * Since these winding direction rules are defined in object space, they are unaffected by instance transforms.  For example, an instance transform matrix with negative determinant (e.g. mirroring some geometry) does not change the facing of the triangles within the instance.  Per-geometry transforms defined in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_triangles_desc">D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC</a> ,  by contrast,  get combined with the associated vertex data in object space, so a negative determinant matrix there does flip triangle winding.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_INSTANCE_FLAG_TRIANGLE_FRONT_COUNTERCLOCKWISE => 2

    /**
     * The instance will act as if   <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_geometry_flags">D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE</a> had been specified for all the geometries in the bottom-level acceleration structure referenced by the instance.  Note that this behavior can be overridden by the ray flag <b>RAY_FLAG_FORCE_NON_OPAQUE</b>.
 * 
 * This flag is mutually exclusive to the <b>D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_NON_OPAQUE</b> flag.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_OPAQUE => 4

    /**
     * The instance will act as if <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_raytracing_geometry_flags">D3D12_RAYTRACING_GEOMETRY_FLAG_OPAQUE</a> had not been specified for any of the geometries in the bottom-level acceleration structure referenced by the instance. Note that this behavior can be overridden by the ray flag <b>RAY_FLAG_FORCE_OPAQUE</b>.
 * 
 * This flag is mutually exclusive to the <b>D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_OPAQUE</b> flag.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_INSTANCE_FLAG_FORCE_NON_OPAQUE => 8
}
