#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHostControl.ahk" { IHostControl }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ICLRControl.ahk" { ICLRControl }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRRuntimeHost extends IUnknown {
    /**
     * The interface identifier for ICLRRuntimeHost
     * @type {Guid}
     */
    static IID := Guid("{90f1a06c-7712-4762-86b5-7a5eba6bdb02}")

    /**
     * The class identifier for CLRRuntimeHost
     * @type {Guid}
     */
    static CLSID := Guid("{90f1a06e-7712-4762-86b5-7a5eba6bdb02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRRuntimeHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start                     : IntPtr
        Stop                      : IntPtr
        SetHostControl            : IntPtr
        GetCLRControl             : IntPtr
        UnloadAppDomain           : IntPtr
        ExecuteInAppDomain        : IntPtr
        GetCurrentAppDomainId     : IntPtr
        ExecuteApplication        : IntPtr
        ExecuteInDefaultAppDomain : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRRuntimeHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHostControl} pHostControl 
     * @returns {HRESULT} 
     */
    SetHostControl(pHostControl) {
        result := ComCall(5, this, "ptr", pHostControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICLRControl} 
     */
    GetCLRControl() {
        result := ComCall(6, this, "ptr*", &pCLRControl := 0, "HRESULT")
        return ICLRControl(pCLRControl)
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {BOOL} fWaitUntilDone 
     * @returns {HRESULT} 
     */
    UnloadAppDomain(dwAppDomainId, fWaitUntilDone) {
        result := ComCall(7, this, "uint", dwAppDomainId, BOOL, fWaitUntilDone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainId 
     * @param {Pointer<FExecuteInAppDomainCallback>} pCallback 
     * @param {Pointer<Void>} cookie 
     * @returns {HRESULT} 
     */
    ExecuteInAppDomain(dwAppDomainId, pCallback, cookie) {
        cookieMarshal := cookie is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwAppDomainId, "ptr", pCallback, cookieMarshal, cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentAppDomainId() {
        result := ComCall(9, this, "uint*", &pdwAppDomainId := 0, "HRESULT")
        return pdwAppDomainId
    }

    /**
     * 
     * @param {PWSTR} pwzAppFullName 
     * @param {Integer} dwManifestPaths 
     * @param {Pointer<PWSTR>} ppwzManifestPaths 
     * @param {Integer} dwActivationData 
     * @param {Pointer<PWSTR>} ppwzActivationData 
     * @returns {Integer} 
     */
    ExecuteApplication(pwzAppFullName, dwManifestPaths, ppwzManifestPaths, dwActivationData, ppwzActivationData) {
        pwzAppFullName := pwzAppFullName is String ? StrPtr(pwzAppFullName) : pwzAppFullName

        ppwzManifestPathsMarshal := ppwzManifestPaths is VarRef ? "ptr*" : "ptr"
        ppwzActivationDataMarshal := ppwzActivationData is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", pwzAppFullName, "uint", dwManifestPaths, ppwzManifestPathsMarshal, ppwzManifestPaths, "uint", dwActivationData, ppwzActivationDataMarshal, ppwzActivationData, "int*", &pReturnValue := 0, "HRESULT")
        return pReturnValue
    }

    /**
     * 
     * @param {PWSTR} pwzAssemblyPath 
     * @param {PWSTR} pwzTypeName 
     * @param {PWSTR} pwzMethodName 
     * @param {PWSTR} pwzArgument 
     * @returns {Integer} 
     */
    ExecuteInDefaultAppDomain(pwzAssemblyPath, pwzTypeName, pwzMethodName, pwzArgument) {
        pwzAssemblyPath := pwzAssemblyPath is String ? StrPtr(pwzAssemblyPath) : pwzAssemblyPath
        pwzTypeName := pwzTypeName is String ? StrPtr(pwzTypeName) : pwzTypeName
        pwzMethodName := pwzMethodName is String ? StrPtr(pwzMethodName) : pwzMethodName
        pwzArgument := pwzArgument is String ? StrPtr(pwzArgument) : pwzArgument

        result := ComCall(11, this, "ptr", pwzAssemblyPath, "ptr", pwzTypeName, "ptr", pwzMethodName, "ptr", pwzArgument, "uint*", &pReturnValue := 0, "HRESULT")
        return pReturnValue
    }

    Query(iid) {
        if (ICLRRuntimeHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.SetHostControl := CallbackCreate(GetMethod(implObj, "SetHostControl"), flags, 2)
        this.vtbl.GetCLRControl := CallbackCreate(GetMethod(implObj, "GetCLRControl"), flags, 2)
        this.vtbl.UnloadAppDomain := CallbackCreate(GetMethod(implObj, "UnloadAppDomain"), flags, 3)
        this.vtbl.ExecuteInAppDomain := CallbackCreate(GetMethod(implObj, "ExecuteInAppDomain"), flags, 4)
        this.vtbl.GetCurrentAppDomainId := CallbackCreate(GetMethod(implObj, "GetCurrentAppDomainId"), flags, 2)
        this.vtbl.ExecuteApplication := CallbackCreate(GetMethod(implObj, "ExecuteApplication"), flags, 7)
        this.vtbl.ExecuteInDefaultAppDomain := CallbackCreate(GetMethod(implObj, "ExecuteInDefaultAppDomain"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.SetHostControl)
        CallbackFree(this.vtbl.GetCLRControl)
        CallbackFree(this.vtbl.UnloadAppDomain)
        CallbackFree(this.vtbl.ExecuteInAppDomain)
        CallbackFree(this.vtbl.GetCurrentAppDomainId)
        CallbackFree(this.vtbl.ExecuteApplication)
        CallbackFree(this.vtbl.ExecuteInDefaultAppDomain)
    }
}
