#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_SHADER_CACHE_SESSION_DESC.ahk" { D3D12_SHADER_CACHE_SESSION_DESC }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * Represents a shader cache session.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12shadercachesession
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ShaderCacheSession extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12ShaderCacheSession
     * @type {Guid}
     */
    static IID := Guid("{28e2495d-0f64-4ae4-a6ec-129255dc49a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ShaderCacheSession interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
        FindValue          : IntPtr
        StoreValue         : IntPtr
        SetDeleteOnDestroy : IntPtr
        GetDesc            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ShaderCacheSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Looks up an entry in the cache whose key exactly matches the provided key.
     * @param {Integer} pKey Type: \_In\_reads\_bytes\_(KeySize) **const void \***
     * 
     * The key of the entry to look up.
     * @param {Integer} KeySize Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the key, in bytes.
     * @param {Integer} pValue Type: \_Out\_writes\_bytes\_(*pValueSize) **void \***
     * 
     * A pointer to a memory block that receives the cached entry.
     * @param {Pointer<Integer>} pValueSize Type: \_Inout\_ **[UINT](/windows/win32/winprog/windows-data-types)\***
     * 
     * A pointer to a **UINT** that receives the size of the cached entry, in bytes.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * | DXGI_ERROR_CACHE_HASH_COLLISION | There's an entry with the same hash as the provided key, but the key doesn't exactly match. |
     * | DXGI_ERROR_NOT_FOUND | The entry isn't present. |
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-findvalue
     */
    FindValue(pKey, KeySize, pValue, pValueSize) {
        pValueSizeMarshal := pValueSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, pValueSizeMarshal, pValueSize, "HRESULT")
        return result
    }

    /**
     * Adds an entry to the cache.
     * @param {Integer} pKey Type: \_In\_reads\_bytes\_(KeySize) **const void \***
     * 
     * The key of the entry to add.
     * @param {Integer} KeySize Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the key, in bytes.
     * @param {Integer} pValue Type: \_In\_reads\_bytes\_(ValueSize) **void \***
     * 
     * A pointer to a memory block containing the entry to add.
     * @param {Integer} ValueSize Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The size of the entry to add, in bytes.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/win32/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * | DXGI_ERROR_ALREADY_EXISTS | There's an entry with the same key. |
     * | DXGI_ERROR_CACHE_HASH_COLLISION | There's an entry with the same hash as the provided key, but the key doesn't match. |
     * | DXGI_ERROR_CACHE_FULL | Adding this entry would cause the cache to become larger than its maximum size. |
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-storevalue
     */
    StoreValue(pKey, KeySize, pValue, ValueSize) {
        result := ComCall(9, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, "uint", ValueSize, "HRESULT")
        return result
    }

    /**
     * When all cache session objects corresponding to a given cache are destroyed, the cache is cleared.
     * @remarks
     * A disk cache can be cleared in one of the following ways.
     * 
     * * Explicitly, by calling **SetDeleteOnDestroy** on the session object, and then releasing the session.
     * * Explicitly, in developer mode, by calling [ID3D12Device9::ShaderCacheControl](nf-d3d12-id3d12device9-shadercachecontrol.md) with [D3D12_SHADER_CACHE_KIND_FLAG_APPLICATION_MANAGED](ne-d3d12-d3d12_shader_cache_kind_flags.md).
     * * Implicitly, by creating a session object with a version that doesn't match the version used to create it.
     * * Externally, by the disk cleanup utility enumerating it and clearing it. This won't happen for caches created with the [D3D12_SHADER_CACHE_FLAG_USE_WORKING_DIR](ne-d3d12-d3d12_shader_cache_flags.md) flag.
     * * Manually, by deleting the files (`*.idx`, `*.val`, and `*.lock`) stored on disk for [D3D12_SHADER_CACHE_FLAG_USE_WORKING_DIR](ne-d3d12-d3d12_shader_cache_flags.md) caches. Your application shouldn't attempt to do this for caches stored outside of the working directory.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-setdeleteondestroy
     */
    SetDeleteOnDestroy() {
        ComCall(10, this)
    }

    /**
     * Retrieves the description used to create the cache session.
     * @returns {D3D12_SHADER_CACHE_SESSION_DESC} A [D3D12_SHADER_CACHE_SESSION_DESC](ns-d3d12-d3d12_shader_cache_session_desc.md) structure representing the description used to create the cache session.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-getdesc
     */
    GetDesc() {
        result := ComCall(11, this, D3D12_SHADER_CACHE_SESSION_DESC)
        return result
    }

    Query(iid) {
        if (ID3D12ShaderCacheSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindValue := CallbackCreate(GetMethod(implObj, "FindValue"), flags, 5)
        this.vtbl.StoreValue := CallbackCreate(GetMethod(implObj, "StoreValue"), flags, 5)
        this.vtbl.SetDeleteOnDestroy := CallbackCreate(GetMethod(implObj, "SetDeleteOnDestroy"), flags, 1)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindValue)
        CallbackFree(this.vtbl.StoreValue)
        CallbackFree(this.vtbl.SetDeleteOnDestroy)
        CallbackFree(this.vtbl.GetDesc)
    }
}
