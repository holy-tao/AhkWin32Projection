#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the level of support for shader caching in the current graphics driver.
 * @remarks
 * 
 * This enum is used by the [D3D11_FEATURE_DATA_SHADER_CACHE](./ns-d3d11-d3d11_feature_data_shader_cache.md) structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_shader_cache_support_flags
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_CACHE_SUPPORT_FLAGS{

    /**
     * Indicates that the driver does not support shader caching.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_CACHE_SUPPORT_NONE => 0

    /**
     * Indicates that the driver supports an OS-managed shader cache that stores compiled shaders in memory during the current run of the application.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_CACHE_SUPPORT_AUTOMATIC_INPROC_CACHE => 1

    /**
     * Indicates that the driver supports an OS-managed shader cache that stores compiled shaders on disk to accelerate future runs of the application.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_CACHE_SUPPORT_AUTOMATIC_DISK_CACHE => 2
}
