#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3DShaderCacheApplication.ahk" { ID3DShaderCacheApplication }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D_SHADER_CACHE_APPLICATION_DESC.ahk" { D3D_SHADER_CACHE_APPLICATION_DESC }
#Import ".\D3D_SHADER_CACHE_TARGET_FLAGS.ahk" { D3D_SHADER_CACHE_TARGET_FLAGS }
#Import "..\..\System\Services\SC_HANDLE.ahk" { SC_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_SHADER_CACHE_COMPILER_PROPERTIES.ahk" { D3D_SHADER_CACHE_COMPILER_PROPERTIES }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct ID3DShaderCacheInstaller extends IUnknown {
    /**
     * The interface identifier for ID3DShaderCacheInstaller
     * @type {Guid}
     */
    static IID := Guid("{bbe30de1-6318-4526-ae17-776693191bb4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DShaderCacheInstaller interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterDriverUpdateListener         : IntPtr
        UnregisterDriverUpdateListener       : IntPtr
        RegisterServiceDriverUpdateTrigger   : IntPtr
        UnregisterServiceDriverUpdateTrigger : IntPtr
        RegisterApplication                  : IntPtr
        RemoveApplication                    : IntPtr
        GetApplicationCount                  : IntPtr
        GetApplication                       : IntPtr
        ClearAllState                        : IntPtr
        GetMaxPrecompileTargetCount          : IntPtr
        GetPrecompileTargets                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DShaderCacheInstaller.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RegisterDriverUpdateListener() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterDriverUpdateListener() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    RegisterServiceDriverUpdateTrigger(hServiceHandle) {
        result := ComCall(5, this, SC_HANDLE, hServiceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hServiceHandle 
     * @returns {HRESULT} 
     */
    UnregisterServiceDriverUpdateTrigger(hServiceHandle) {
        result := ComCall(6, this, SC_HANDLE, hServiceHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pExePath 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    RegisterApplication(pExePath, pApplicationDesc, riid) {
        pExePath := pExePath is String ? StrPtr(pExePath) : pExePath

        result := ComCall(7, this, "ptr", pExePath, D3D_SHADER_CACHE_APPLICATION_DESC.Ptr, pApplicationDesc, Guid.Ptr, riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }

    /**
     * 
     * @param {ID3DShaderCacheApplication} pApplication 
     * @returns {HRESULT} 
     */
    RemoveApplication(pApplication) {
        result := ComCall(8, this, "ptr", pApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetApplicationCount() {
        result := ComCall(9, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetApplication(index, riid) {
        result := ComCall(10, this, "uint", index, Guid.Ptr, riid, "ptr*", &ppvApp := 0, "HRESULT")
        return ppvApp
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllState() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxPrecompileTargetCount() {
        result := ComCall(12, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Pointer<D3D_SHADER_CACHE_APPLICATION_DESC>} pApplicationDesc 
     * @param {Pointer<Integer>} pArraySize 
     * @param {D3D_SHADER_CACHE_TARGET_FLAGS} flags 
     * @returns {D3D_SHADER_CACHE_COMPILER_PROPERTIES} 
     */
    GetPrecompileTargets(pApplicationDesc, pArraySize, flags) {
        pArraySizeMarshal := pArraySize is VarRef ? "uint*" : "ptr"

        pArray := D3D_SHADER_CACHE_COMPILER_PROPERTIES()
        result := ComCall(13, this, D3D_SHADER_CACHE_APPLICATION_DESC.Ptr, pApplicationDesc, pArraySizeMarshal, pArraySize, D3D_SHADER_CACHE_COMPILER_PROPERTIES.Ptr, pArray, D3D_SHADER_CACHE_TARGET_FLAGS, flags, "HRESULT")
        return pArray
    }

    Query(iid) {
        if (ID3DShaderCacheInstaller.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterDriverUpdateListener := CallbackCreate(GetMethod(implObj, "RegisterDriverUpdateListener"), flags, 1)
        this.vtbl.UnregisterDriverUpdateListener := CallbackCreate(GetMethod(implObj, "UnregisterDriverUpdateListener"), flags, 1)
        this.vtbl.RegisterServiceDriverUpdateTrigger := CallbackCreate(GetMethod(implObj, "RegisterServiceDriverUpdateTrigger"), flags, 2)
        this.vtbl.UnregisterServiceDriverUpdateTrigger := CallbackCreate(GetMethod(implObj, "UnregisterServiceDriverUpdateTrigger"), flags, 2)
        this.vtbl.RegisterApplication := CallbackCreate(GetMethod(implObj, "RegisterApplication"), flags, 5)
        this.vtbl.RemoveApplication := CallbackCreate(GetMethod(implObj, "RemoveApplication"), flags, 2)
        this.vtbl.GetApplicationCount := CallbackCreate(GetMethod(implObj, "GetApplicationCount"), flags, 1)
        this.vtbl.GetApplication := CallbackCreate(GetMethod(implObj, "GetApplication"), flags, 4)
        this.vtbl.ClearAllState := CallbackCreate(GetMethod(implObj, "ClearAllState"), flags, 1)
        this.vtbl.GetMaxPrecompileTargetCount := CallbackCreate(GetMethod(implObj, "GetMaxPrecompileTargetCount"), flags, 1)
        this.vtbl.GetPrecompileTargets := CallbackCreate(GetMethod(implObj, "GetPrecompileTargets"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterDriverUpdateListener)
        CallbackFree(this.vtbl.UnregisterDriverUpdateListener)
        CallbackFree(this.vtbl.RegisterServiceDriverUpdateTrigger)
        CallbackFree(this.vtbl.UnregisterServiceDriverUpdateTrigger)
        CallbackFree(this.vtbl.RegisterApplication)
        CallbackFree(this.vtbl.RemoveApplication)
        CallbackFree(this.vtbl.GetApplicationCount)
        CallbackFree(this.vtbl.GetApplication)
        CallbackFree(this.vtbl.ClearAllState)
        CallbackFree(this.vtbl.GetMaxPrecompileTargetCount)
        CallbackFree(this.vtbl.GetPrecompileTargets)
    }
}
