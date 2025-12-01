#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a kind of shader cache.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_kind_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_KIND_FLAGS extends Win32BitflagEnum{

    /**
     * Specifies a cache that's managed by Direct3D 12 to store driver compilations of application shaders.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_D3D_CACHE_FOR_DRIVER => 1

    /**
     * Specifies a cache that's used to store Direct3D 12's conversions of one shader type to another (for example, DXBC shaders to DXIL shaders).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_D3D_CONVERSIONS => 2

    /**
     * Specifies a cache that's managed by the driver. Operations for this cache are hints.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_IMPLICIT_DRIVER_MANAGED => 4

    /**
     * Specifies all shader cache sessions created by the [ID3D12Device9::CreateShaderCacheSession](nf-d3d12-id3d12device9-createshadercachesession.md) method. Requests to **CLEAR** with this flag apply to all currently active application cache sessions, as well as on-disk caches created without [D3D12_SHADER_CACHE_FLAG_USE_WORKING_DIR](ne-d3d12-d3d12_shader_cache_flags.md).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_KIND_FLAG_APPLICATION_MANAGED => 8
}
