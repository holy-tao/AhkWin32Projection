#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify shader cache flags.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_FLAGS{

    /**
     * Specifies no flag.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_NONE => 0

    /**
     * Specifies that the cache is implicitly versioned by the driver being used. For multi-GPU systems, a cache created this way is stored side by side for each adapter on which the application runs. The *Version* field in the [D3D12_SHADER_CACHE_SESSION_DESC](ns-d3d12-d3d12_shader_cache_session_desc.md) struct (the cache description) is used as an additional constraint.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_DRIVER_VERSIONED => 1

    /**
     * By default, caches are stored in temporary storage, and can be cleared by disk cleanup. This constant (not valid for UWP apps) specifies that the cache is instead stored in the current working directory.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_FLAG_USE_WORKING_DIR => 2
}
