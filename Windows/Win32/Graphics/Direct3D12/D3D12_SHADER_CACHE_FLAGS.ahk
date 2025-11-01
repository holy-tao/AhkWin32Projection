#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_DRIVER_VERSIONED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_USE_WORKING_DIR => 2
}
