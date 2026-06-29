#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3DShaderCacheComponent.ahk" { ID3DShaderCacheComponent }
#Import ".\D3D_SHADER_CACHE_PSDB_PROPERTIES.ahk" { D3D_SHADER_CACHE_PSDB_PROPERTIES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D_SHADER_CACHE_APPLICATION_DESC.ahk" { D3D_SHADER_CACHE_APPLICATION_DESC }
#Import ".\D3D_SHADER_CACHE_TARGET_FLAGS.ahk" { D3D_SHADER_CACHE_TARGET_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_SHADER_CACHE_COMPILER_PROPERTIES.ahk" { D3D_SHADER_CACHE_COMPILER_PROPERTIES }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheApplication extends IUnknown {
    /**
     * The interface identifier for ID3DShaderCacheApplication
     * @type {Guid}
     */
    static IID := Guid("{fc688ee2-1b35-4913-93be-1ca3fa7df39e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheApplication interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExePath               : IntPtr
        GetDesc                  : IntPtr
        RegisterComponent        : IntPtr
        RemoveComponent          : IntPtr
        GetComponentCount        : IntPtr
        GetComponent             : IntPtr
        GetPrecompileTargetCount : IntPtr
        GetPrecompileTargets     : IntPtr
        GetInstallerName         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetExePath() {
        result := ComCall(3, this, "ptr*", &pExePath := 0, "HRESULT")
        return pExePath
    }

    /**
     * 
     * @returns {D3D_SHADER_CACHE_APPLICATION_DESC} 
     */
    GetDesc() {
        pApplicationDesc := D3D_SHADER_CACHE_APPLICATION_DESC()
        result := ComCall(4, this, D3D_SHADER_CACHE_APPLICATION_DESC.Ptr, pApplicationDesc, "HRESULT")
        return pApplicationDesc
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @param {PWSTR} pStateObjectDBPath 
     * @param {Integer} NumPSDB 
     * @param {Pointer<D3D_SHADER_CACHE_PSDB_PROPERTIES>} pPSDBs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RegisterComponent(pName, pStateObjectDBPath, NumPSDB, pPSDBs, riid) {
        pName := pName is String ? StrPtr(pName) : pName
        pStateObjectDBPath := pStateObjectDBPath is String ? StrPtr(pStateObjectDBPath) : pStateObjectDBPath

        result := ComCall(5, this, "ptr", pName, "ptr", pStateObjectDBPath, "uint", NumPSDB, D3D_SHADER_CACHE_PSDB_PROPERTIES.Ptr, pPSDBs, Guid.Ptr, riid, "ptr*", &ppvComponent := 0, "HRESULT")
        return ppvComponent
    }

    /**
     * 
     * @param {ID3DShaderCacheComponent} pComponent 
     * @returns {HRESULT} 
     */
    RemoveComponent(pComponent) {
        result := ComCall(6, this, "ptr", pComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetComponentCount() {
        result := ComCall(7, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetComponent(index, riid) {
        result := ComCall(8, this, "uint", index, Guid.Ptr, riid, "ptr*", &ppvComponent := 0, "HRESULT")
        return ppvComponent
    }

    /**
     * 
     * @param {D3D_SHADER_CACHE_TARGET_FLAGS} flags 
     * @returns {Integer} 
     */
    GetPrecompileTargetCount(flags) {
        result := ComCall(9, this, D3D_SHADER_CACHE_TARGET_FLAGS, flags, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} ArraySize 
     * @param {Pointer<D3D_SHADER_CACHE_COMPILER_PROPERTIES>} pArray 
     * @param {D3D_SHADER_CACHE_TARGET_FLAGS} flags 
     * @returns {HRESULT} 
     */
    GetPrecompileTargets(ArraySize, pArray, flags) {
        result := ComCall(10, this, "uint", ArraySize, D3D_SHADER_CACHE_COMPILER_PROPERTIES.Ptr, pArray, D3D_SHADER_CACHE_TARGET_FLAGS, flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetInstallerName() {
        result := ComCall(11, this, "ptr*", &pInstallerName := 0, "HRESULT")
        return pInstallerName
    }

    Query(iid) {
        if (ID3DShaderCacheApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExePath := CallbackCreate(GetMethod(implObj, "GetExePath"), flags, 2)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
        this.vtbl.RegisterComponent := CallbackCreate(GetMethod(implObj, "RegisterComponent"), flags, 7)
        this.vtbl.RemoveComponent := CallbackCreate(GetMethod(implObj, "RemoveComponent"), flags, 2)
        this.vtbl.GetComponentCount := CallbackCreate(GetMethod(implObj, "GetComponentCount"), flags, 1)
        this.vtbl.GetComponent := CallbackCreate(GetMethod(implObj, "GetComponent"), flags, 4)
        this.vtbl.GetPrecompileTargetCount := CallbackCreate(GetMethod(implObj, "GetPrecompileTargetCount"), flags, 2)
        this.vtbl.GetPrecompileTargets := CallbackCreate(GetMethod(implObj, "GetPrecompileTargets"), flags, 4)
        this.vtbl.GetInstallerName := CallbackCreate(GetMethod(implObj, "GetInstallerName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExePath)
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.RegisterComponent)
        CallbackFree(this.vtbl.RemoveComponent)
        CallbackFree(this.vtbl.GetComponentCount)
        CallbackFree(this.vtbl.GetComponent)
        CallbackFree(this.vtbl.GetPrecompileTargetCount)
        CallbackFree(this.vtbl.GetPrecompileTargets)
        CallbackFree(this.vtbl.GetInstallerName)
    }
}
