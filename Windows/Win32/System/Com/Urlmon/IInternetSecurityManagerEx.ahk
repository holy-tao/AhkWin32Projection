#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInternetSecurityManager.ahk" { IInternetSecurityManager }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetSecurityManagerEx extends IInternetSecurityManager {
    /**
     * The interface identifier for IInternetSecurityManagerEx
     * @type {Guid}
     */
    static IID := Guid("{f164edf1-cc7c-4f0d-9a94-34222625c393}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetSecurityManagerEx interfaces
    */
    struct Vtbl extends IInternetSecurityManager.Vtbl {
        ProcessUrlActionEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetSecurityManagerEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Pointer<Integer>} pContext 
     * @param {Integer} cbContext 
     * @param {Integer} dwFlags 
     * @param {Integer} dwReserved 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    ProcessUrlActionEx(pwszUrl, dwAction, pPolicy, cbPolicy, pContext, cbContext, dwFlags, dwReserved, pdwOutFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"
        pContextMarshal := pContext is VarRef ? "char*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pwszUrl, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, pContextMarshal, pContext, "uint", cbContext, "uint", dwFlags, "uint", dwReserved, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetSecurityManagerEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessUrlActionEx := CallbackCreate(GetMethod(implObj, "ProcessUrlActionEx"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessUrlActionEx)
    }
}
