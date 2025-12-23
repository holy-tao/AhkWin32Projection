#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the level of support for shader caching in the current graphics driver. (D3D12_SHADER_CACHE_SUPPORT_FLAGS)
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_shader_cache">D3D_FEATURE_DATA_SHADER_CACHE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_support_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_SUPPORT_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates that the driver does not support shader caching.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_NONE => 0

    /**
     * Indicates that the driver supports the CachedPSO member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc">D3D12_GRAPHICS_PIPELINE_STATE_DESC</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc">D3D12_COMPUTE_PIPELINE_STATE_DESC</a> structures. This is always supported.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_SINGLE_PSO => 1

    /**
     * Indicates that the driver supports the ID3D12PipelineLibrary interface, which provides application-controlled PSO grouping and caching. This is supported by drivers targetting the Windows 10 Anniversary Update.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_LIBRARY => 2

    /**
     * Indicates that the driver supports an OS-managed shader cache that stores compiled shaders in memory during the current run of the application.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_INPROC_CACHE => 4

    /**
     * Indicates that the driver supports an OS-managed shader cache that stores compiled shaders on disk to accelerate future runs of the application.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_AUTOMATIC_DISK_CACHE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_DRIVER_MANAGED_CACHE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_SHADER_CONTROL_CLEAR => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_SUPPORT_SHADER_SESSION_DELETE => 64
}
