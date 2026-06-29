#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetHostSecurityManager extends IUnknown {
    /**
     * The interface identifier for IInternetHostSecurityManager
     * @type {Guid}
     */
    static IID := Guid("{3af280b6-cb3f-11d0-891e-00c04fb6bfc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetHostSecurityManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSecurityId     : IntPtr
        ProcessUrlAction  : IntPtr
        QueryCustomPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetHostSecurityManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbSecurityId 
     * @param {Pointer} dwReserved 
     * @returns {Integer} 
     */
    GetSecurityId(pcbSecurityId, dwReserved) {
        pcbSecurityIdMarshal := pcbSecurityId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "char*", &pbSecurityId := 0, pcbSecurityIdMarshal, pcbSecurityId, "ptr", dwReserved, "HRESULT")
        return pbSecurityId
    }

    /**
     * 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @returns {Integer} 
     */
    ProcessUrlAction(dwAction, cbPolicy, pContext, cbContext, dwFlags, dwReserved) {
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    QueryCustomPolicy(guidKey, ppPolicy, pcbPolicy, pContext, cbContext, dwReserved) {
        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetHostSecurityManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecurityId := CallbackCreate(GetMethod(implObj, "GetSecurityId"), flags, 4)
        this.vtbl.ProcessUrlAction := CallbackCreate(GetMethod(implObj, "ProcessUrlAction"), flags, 8)
        this.vtbl.QueryCustomPolicy := CallbackCreate(GetMethod(implObj, "QueryCustomPolicy"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecurityId)
        CallbackFree(this.vtbl.ProcessUrlAction)
        CallbackFree(this.vtbl.QueryCustomPolicy)
    }
}
