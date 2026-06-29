#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SHADER_CACHE_MODE.ahk" { D3D12_SHADER_CACHE_MODE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_SHADER_CACHE_FLAGS.ahk" { D3D12_SHADER_CACHE_FLAGS }

/**
 * Describes a shader cache session.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_cache_session_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_CACHE_SESSION_DESC {
    #StructPack 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A unique identifier to give to this specific cache. Caches with different identifiers are stored side by side. Caches with the same identifier are shared across all sessions in the same process. Creating a disk cache with the same identifier as an already-existing cache opens that cache, unless the **Version** doesn't matches. In that case, if there are no other sessions open to that cache, it is cleared and re-created. If there are existing sessions, then [ID3D12Device9::CreateShaderCacheSession](nf-d3d12-id3d12device9-createshadercachesession.md) returns **DXGI_ERROR_ALREADY_EXISTS**.
     */
    Identifier : Guid

    /**
     * Type: **[D3D12_SHADER_CACHE_MODE](ne-d3d12-d3d12_shader_cache_mode.md)**
     * 
     * Specifies the kind of cache.
     */
    Mode : D3D12_SHADER_CACHE_MODE

    /**
     * Type: **[D3D12_SHADER_CACHE_FLAGS](ne-d3d12-d3d12_shader_cache_flags.md)**
     * 
     * Modifies the behavior of the cache.
     */
    Flags : D3D12_SHADER_CACHE_FLAGS

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * For in-memory caches, this is the only storage available. For disk caches, all entries that are stored or found are temporarily stored in memory, until evicted by newer entries. This value determines the size of that temporary storage. Defaults to 1KB.
     */
    MaximumInMemoryCacheSizeBytes : UInt32

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * Specifies how many entries can be stored in memory. Defaults to 128.
     */
    MaximumInMemoryCacheEntries : UInt32

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * For disk caches, controls the maximum file size. Defaults to 128MB.
     */
    MaximumValueFileSizeBytes : UInt32

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * Can be used to implicitly clear caches when an application or component update is done. If the version doesn't match the version stored in the cache, then it will be wiped and re-created.
     */
    Version : Int64

}
