#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\METAHOST_POLICY_FLAGS.ahk" { METAHOST_POLICY_FLAGS }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRMetaHostPolicy extends IUnknown {
    /**
     * The interface identifier for ICLRMetaHostPolicy
     * @type {Guid}
     */
    static IID := Guid("{e2190695-77b2-492e-8e14-c4b3a7fdd593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRMetaHostPolicy interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRequestedRuntime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRMetaHostPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {METAHOST_POLICY_FLAGS} dwPolicyFlags 
     * @param {PWSTR} pwzBinary 
     * @param {IStream} pCfgStream 
     * @param {PWSTR} pwzVersion 
     * @param {Pointer<Integer>} pcchVersion 
     * @param {PWSTR} pwzImageVersion 
     * @param {Pointer<Integer>} pcchImageVersion 
     * @param {Pointer<Integer>} pdwConfigFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetRequestedRuntime(dwPolicyFlags, pwzBinary, pCfgStream, pwzVersion, pcchVersion, pwzImageVersion, pcchImageVersion, pdwConfigFlags, riid) {
        pwzBinary := pwzBinary is String ? StrPtr(pwzBinary) : pwzBinary
        pwzVersion := pwzVersion is String ? StrPtr(pwzVersion) : pwzVersion
        pwzImageVersion := pwzImageVersion is String ? StrPtr(pwzImageVersion) : pwzImageVersion

        pcchVersionMarshal := pcchVersion is VarRef ? "uint*" : "ptr"
        pcchImageVersionMarshal := pcchImageVersion is VarRef ? "uint*" : "ptr"
        pdwConfigFlagsMarshal := pdwConfigFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, METAHOST_POLICY_FLAGS, dwPolicyFlags, "ptr", pwzBinary, "ptr", pCfgStream, "ptr", pwzVersion, pcchVersionMarshal, pcchVersion, "ptr", pwzImageVersion, pcchImageVersionMarshal, pcchImageVersion, pdwConfigFlagsMarshal, pdwConfigFlags, Guid.Ptr, riid, "ptr*", &ppRuntime := 0, "HRESULT")
        return ppRuntime
    }

    Query(iid) {
        if (ICLRMetaHostPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequestedRuntime := CallbackCreate(GetMethod(implObj, "GetRequestedRuntime"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequestedRuntime)
    }
}
