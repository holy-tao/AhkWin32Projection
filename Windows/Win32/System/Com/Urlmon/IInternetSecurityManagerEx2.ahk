#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IInternetSecurityManagerEx.ahk" { IInternetSecurityManagerEx }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUri.ahk" { IUri }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetSecurityManagerEx2 extends IInternetSecurityManagerEx {
    /**
     * The interface identifier for IInternetSecurityManagerEx2
     * @type {Guid}
     */
    static IID := Guid("{f1e50292-a795-4117-8e09-2b560a72ac60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetSecurityManagerEx2 interfaces
    */
    struct Vtbl extends IInternetSecurityManagerEx.Vtbl {
        MapUrlToZoneEx2      : IntPtr
        ProcessUrlActionEx2  : IntPtr
        GetSecurityIdEx2     : IntPtr
        QueryCustomPolicyEx2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetSecurityManagerEx2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Integer>} pdwZone 
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} ppwszMappedUrl 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    MapUrlToZoneEx2(pUri, pdwZone, dwFlags, ppwszMappedUrl, pdwOutFlags) {
        pdwZoneMarshal := pdwZone is VarRef ? "uint*" : "ptr"
        ppwszMappedUrlMarshal := ppwszMappedUrl is VarRef ? "ptr*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pUri, pdwZoneMarshal, pdwZone, "uint", dwFlags, ppwszMappedUrlMarshal, ppwszMappedUrl, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    ProcessUrlActionEx2(pUri, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved, pdwOutFlags) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pUri, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "ptr", dwReserved, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetSecurityIdEx2(pUri, pcbSecurityId, dwReserved) {
        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pUri, "char*", &pbSecurityId := 0, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return pbSecurityId
    }

    /**
     * 
     * @param {IUri} pUri 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Pointer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicyEx2(pUri, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "ptr", pUri, Guid.Ptr, guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, pContextMarshal, pContext, "uint", cbContext, "ptr", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetSecurityManagerEx2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MapUrlToZoneEx2 := CallbackCreate(GetMethod(implObj, "MapUrlToZoneEx2"), flags, 6)
        this.vtbl.ProcessUrlActionEx2 := CallbackCreate(GetMethod(implObj, "ProcessUrlActionEx2"), flags, 10)
        this.vtbl.GetSecurityIdEx2 := CallbackCreate(GetMethod(implObj, "GetSecurityIdEx2"), flags, 5)
        this.vtbl.QueryCustomPolicyEx2 := CallbackCreate(GetMethod(implObj, "QueryCustomPolicyEx2"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MapUrlToZoneEx2)
        CallbackFree(this.vtbl.ProcessUrlActionEx2)
        CallbackFree(this.vtbl.GetSecurityIdEx2)
        CallbackFree(this.vtbl.QueryCustomPolicyEx2)
    }
}
