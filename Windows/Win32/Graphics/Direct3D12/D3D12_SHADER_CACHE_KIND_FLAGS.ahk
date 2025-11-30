#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_kind_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_KIND_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_D3D_CACHE_FOR_DRIVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_D3D_CONVERSIONS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_DRIVER_MANAGED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_APPLICATION_MANAGED => 8
}
