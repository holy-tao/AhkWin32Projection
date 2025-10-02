#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify configuration flags for a raytracing pipeline.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_pipeline_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_PIPELINE_FLAGS{

    /**
     * Specifies no option.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_NONE => 0

    /**
     * Specifies that for any **TraceRay** call within this raytracing pipeline, the [RAY_FLAG_SKIP_TRIANGLES](/windows/win32/api/d3d12/ne-d3d12-d3d12_ray_flags) ray flag should be added in. The resulting combination of ray flags must be valid. The presence of this flag in a raytracing pipeline config doesn't show up in a **RayFlags** call from a shader. Implementations might be able to optimize pipelines knowing that a particular primitive type need not be considered.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_SKIP_TRIANGLES => 256

    /**
     * Specifies that for any **TraceRay** call within this raytracing pipeline, the [RAY_FLAG_SKIP_PROCEDURAL_PRIMITIVES](/windows/win32/api/d3d12/ne-d3d12-d3d12_ray_flags) ray flag should be added in.
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_SKIP_PROCEDURAL_PRIMITIVES => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_ALLOW_OPACITY_MICROMAPS => 1024
}
