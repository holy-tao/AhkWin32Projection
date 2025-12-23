#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify shader cache control options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_control_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_CONTROL_FLAGS extends Win32BitflagEnum{

    /**
     * Specifies that the cache shouldn't be used to look up data, and shouldn't have new data stored in it. Attempts to use/create a cache while it's disabled result in **DXGI_ERROR_NOT_CURRENTLY_AVAILABLE**.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_DISABLE => 1

    /**
     * Specfies that use of the cache should be resumed.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_ENABLE => 2

    /**
     * Specfies that any existing contents of the cache should be deleted.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_CLEAR => 4
}
