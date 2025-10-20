#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_control_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_CONTROL_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_DISABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_ENABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_CLEAR => 4
}
