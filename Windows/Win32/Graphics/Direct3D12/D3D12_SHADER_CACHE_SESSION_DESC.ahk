#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SHADER_CACHE_FLAGS.ahk
#Include .\D3D12_SHADER_CACHE_MODE.ahk

/**
 * Describes a shader cache session.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_cache_session_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SHADER_CACHE_SESSION_DESC extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: **[GUID](/windows/win32/api/guiddef/ns-guiddef-guid)**
     * 
     * A unique identifier to give to this specific cache. Caches with different identifiers are stored side by side. Caches with the same identifier are shared across all sessions in the same process. Creating a disk cache with the same identifier as an already-existing cache opens that cache, unless the **Version** doesn't matches. In that case, if there are no other sessions open to that cache, it is cleared and re-created. If there are existing sessions, then [ID3D12Device9::CreateShaderCacheSession](nf-d3d12-id3d12device9-createshadercachesession.md) returns **DXGI_ERROR_ALREADY_EXISTS**.
     * @type {Guid}
     */
    Identifier {
        get {
            if(!this.HasProp("__Identifier"))
                this.__Identifier := Guid(0, this)
            return this.__Identifier
        }
    }

    /**
     * Type: **[D3D12_SHADER_CACHE_MODE](ne-d3d12-d3d12_shader_cache_mode.md)**
     * 
     * Specifies the kind of cache.
     * @type {D3D12_SHADER_CACHE_MODE}
     */
    Mode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: **[D3D12_SHADER_CACHE_FLAGS](ne-d3d12-d3d12_shader_cache_flags.md)**
     * 
     * Modifies the behavior of the cache.
     * @type {D3D12_SHADER_CACHE_FLAGS}
     */
    Flags {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * For in-memory caches, this is the only storage available. For disk caches, all entries that are stored or found are temporarily stored in memory, until evicted by newer entries. This value determines the size of that temporary storage. Defaults to 1KB.
     * @type {Integer}
     */
    MaximumInMemoryCacheSizeBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * Specifies how many entries can be stored in memory. Defaults to 128.
     * @type {Integer}
     */
    MaximumInMemoryCacheEntries {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * For disk caches, controls the maximum file size. Defaults to 128MB.
     * @type {Integer}
     */
    MaximumValueFileSizeBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * Can be used to implicitly clear caches when an application or component update is done. If the version doesn't match the version stored in the cache, then it will be wiped and re-created.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
