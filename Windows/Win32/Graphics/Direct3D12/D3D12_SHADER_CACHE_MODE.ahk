#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a shader cache's mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_CACHE_MODE extends Win32Enum{

    /**
     * Specifies that there's no backing file for this cache. All stores are discarded when the session object is destroyed.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_MODE_MEMORY => 0

    /**
     * Specifies that the session is backed by files on disk that persist from run to run unless cleared. For ways to clear a disk cache, see [ID3D12ShaderCacheSession::SetDeleteOnDestroy](nf-d3d12-id3d12shadercachesession-setdeleteondestroy.md).
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_MODE_DISK => 1
}
