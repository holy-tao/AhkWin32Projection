#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of geometry used for raytracing. Use a value from this enumeration to specify the geometry type in a D3D12_RAYTRACING_GEOMETRY_DESC.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_geometry_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_GEOMETRY_TYPE extends Win32Enum{

    /**
     * The geometry consists of triangles.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_TYPE_TRIANGLES => 0

    /**
     * The geometry procedurally is defined during raytracing by intersection shaders.  For the purpose of acceleration structure builds, the geometry’s bounds are described with axis-aligned bounding boxes using the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_aabbs_desc">D3D12_RAYTRACING_GEOMETRY_AABBS_DESC</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_TYPE_PROCEDURAL_PRIMITIVE_AABBS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_GEOMETRY_TYPE_OMM_TRIANGLES => 2
}
