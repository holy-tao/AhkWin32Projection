#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D_SHADER_CACHE_PSDB_PROPERTIES.ahk" { D3D_SHADER_CACHE_PSDB_PROPERTIES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheComponent extends IUnknown {
    /**
     * The interface identifier for ID3DShaderCacheComponent
     * @type {Guid}
     */
    static IID := Guid("{eed1bf00-f5c7-4cf7-885c-d0f9c0cb4828}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheComponent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetComponentName                  : IntPtr
        GetStateObjectDatabasePath        : IntPtr
        GetPrecompiledCachePath           : IntPtr
        GetPrecompiledShaderDatabaseCount : IntPtr
        GetPrecompiledShaderDatabases     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheComponent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetComponentName() {
        result := ComCall(3, this, "ptr*", &pName := 0, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetStateObjectDatabasePath() {
        result := ComCall(4, this, "ptr*", &pPath := 0, "HRESULT")
        return pPath
    }

    /**
     * 
     * @param {PWSTR} pAdapterFamily 
     * @param {Pointer<Pointer<Integer>>} pPath 
     * @returns {HRESULT} 
     */
    GetPrecompiledCachePath(pAdapterFamily, pPath) {
        pAdapterFamily := pAdapterFamily is String ? StrPtr(pAdapterFamily) : pAdapterFamily

        pPathMarshal := pPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pAdapterFamily, pPathMarshal, pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPrecompiledShaderDatabaseCount() {
        result := ComCall(6, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} ArraySize 
     * @returns {D3D_SHADER_CACHE_PSDB_PROPERTIES} 
     */
    GetPrecompiledShaderDatabases(ArraySize) {
        pPSDBs := D3D_SHADER_CACHE_PSDB_PROPERTIES()
        result := ComCall(7, this, "uint", ArraySize, D3D_SHADER_CACHE_PSDB_PROPERTIES.Ptr, pPSDBs, "HRESULT")
        return pPSDBs
    }

    Query(iid) {
        if (ID3DShaderCacheComponent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetComponentName := CallbackCreate(GetMethod(implObj, "GetComponentName"), flags, 2)
        this.vtbl.GetStateObjectDatabasePath := CallbackCreate(GetMethod(implObj, "GetStateObjectDatabasePath"), flags, 2)
        this.vtbl.GetPrecompiledCachePath := CallbackCreate(GetMethod(implObj, "GetPrecompiledCachePath"), flags, 3)
        this.vtbl.GetPrecompiledShaderDatabaseCount := CallbackCreate(GetMethod(implObj, "GetPrecompiledShaderDatabaseCount"), flags, 1)
        this.vtbl.GetPrecompiledShaderDatabases := CallbackCreate(GetMethod(implObj, "GetPrecompiledShaderDatabases"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetComponentName)
        CallbackFree(this.vtbl.GetStateObjectDatabasePath)
        CallbackFree(this.vtbl.GetPrecompiledCachePath)
        CallbackFree(this.vtbl.GetPrecompiledShaderDatabaseCount)
        CallbackFree(this.vtbl.GetPrecompiledShaderDatabases)
    }
}
