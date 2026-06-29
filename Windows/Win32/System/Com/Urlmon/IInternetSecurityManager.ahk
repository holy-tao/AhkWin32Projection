#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IEnumString.ahk" { IEnumString }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInternetSecurityMgrSite.ahk" { IInternetSecurityMgrSite }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetSecurityManager extends IUnknown {
    /**
     * The interface identifier for IInternetSecurityManager
     * @type {Guid}
     */
    static IID := Guid("{79eac9ee-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetSecurityManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSecuritySite   : IntPtr
        GetSecuritySite   : IntPtr
        MapUrlToZone      : IntPtr
        GetSecurityId     : IntPtr
        ProcessUrlAction  : IntPtr
        QueryCustomPolicy : IntPtr
        SetZoneMapping    : IntPtr
        GetZoneMappings   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetSecurityManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IInternetSecurityMgrSite} pSite 
     * @returns {HRESULT} 
     */
    SetSecuritySite(pSite) {
        result := ComCall(3, this, "ptr", pSite, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInternetSecurityMgrSite} 
     */
    GetSecuritySite() {
        result := ComCall(4, this, "ptr*", &ppSite := 0, "HRESULT")
        return IInternetSecurityMgrSite(ppSite)
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    MapUrlToZone(pwszUrl, dwFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(5, this, "ptr", pwszUrl, "uint*", &pdwZone := 0, "uint", dwFlags, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetSecurityId(pwszUrl, pcbSecurityId, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszUrl, "char*", &pbSecurityId := 0, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return pbSecurityId
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    ProcessUrlAction(pwszUrl, dwAction, cbPolicy, pContext, cbContext, dwFlags, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", pwszUrl, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicy(pwszUrl, guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", pwszUrl, Guid.Ptr, guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {PWSTR} lpszPattern 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetZoneMapping(dwZone, lpszPattern, dwFlags) {
        lpszPattern := lpszPattern is String ? StrPtr(lpszPattern) : lpszPattern

        result := ComCall(9, this, "uint", dwZone, "ptr", lpszPattern, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwFlags 
     * @returns {IEnumString} 
     */
    GetZoneMappings(dwZone, dwFlags) {
        result := ComCall(10, this, "uint", dwZone, "ptr*", &ppenumString := 0, "uint", dwFlags, "HRESULT")
        return IEnumString(ppenumString)
    }

    Query(iid) {
        if (IInternetSecurityManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSecuritySite := CallbackCreate(GetMethod(implObj, "SetSecuritySite"), flags, 2)
        this.vtbl.GetSecuritySite := CallbackCreate(GetMethod(implObj, "GetSecuritySite"), flags, 2)
        this.vtbl.MapUrlToZone := CallbackCreate(GetMethod(implObj, "MapUrlToZone"), flags, 4)
        this.vtbl.GetSecurityId := CallbackCreate(GetMethod(implObj, "GetSecurityId"), flags, 5)
        this.vtbl.ProcessUrlAction := CallbackCreate(GetMethod(implObj, "ProcessUrlAction"), flags, 9)
        this.vtbl.QueryCustomPolicy := CallbackCreate(GetMethod(implObj, "QueryCustomPolicy"), flags, 8)
        this.vtbl.SetZoneMapping := CallbackCreate(GetMethod(implObj, "SetZoneMapping"), flags, 4)
        this.vtbl.GetZoneMappings := CallbackCreate(GetMethod(implObj, "GetZoneMappings"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSecuritySite)
        CallbackFree(this.vtbl.GetSecuritySite)
        CallbackFree(this.vtbl.MapUrlToZone)
        CallbackFree(this.vtbl.GetSecurityId)
        CallbackFree(this.vtbl.ProcessUrlAction)
        CallbackFree(this.vtbl.QueryCustomPolicy)
        CallbackFree(this.vtbl.SetZoneMapping)
        CallbackFree(this.vtbl.GetZoneMappings)
    }
}
