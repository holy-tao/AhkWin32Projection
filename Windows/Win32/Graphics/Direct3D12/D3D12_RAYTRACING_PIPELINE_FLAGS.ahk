#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_pipeline_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_PIPELINE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_SKIP_TRIANGLES => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_SKIP_PROCEDURAL_PRIMITIVES => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RAYTRACING_PIPELINE_FLAG_ALLOW_OPACITY_MICROMAPS => 1024
}
