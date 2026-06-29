#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITpmVirtualSmartCardManager2.ahk" { ITpmVirtualSmartCardManager2 }
#Import ".\TPMVSC_ATTESTATION_TYPE.ahk" { TPMVSC_ATTESTATION_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITpmVirtualSmartCardManagerStatusCallback.ahk" { ITpmVirtualSmartCardManagerStatusCallback }

/**
 * @namespace Windows.Win32.Security.Tpm
 */
export default struct ITpmVirtualSmartCardManager3 extends ITpmVirtualSmartCardManager2 {
    /**
     * The interface identifier for ITpmVirtualSmartCardManager3
     * @type {Guid}
     */
    static IID := Guid("{3c745a97-f375-4150-be17-5950f694c699}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITpmVirtualSmartCardManager3 interfaces
    */
    struct Vtbl extends ITpmVirtualSmartCardManager2.Vtbl {
        CreateVirtualSmartCardWithAttestation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITpmVirtualSmartCardManager3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszFriendlyName 
     * @param {Integer} bAdminAlgId 
     * @param {Pointer<Integer>} pbAdminKey 
     * @param {Integer} cbAdminKey 
     * @param {Pointer<Integer>} pbAdminKcv 
     * @param {Integer} cbAdminKcv 
     * @param {Pointer<Integer>} pbPuk 
     * @param {Integer} cbPuk 
     * @param {Pointer<Integer>} pbPin 
     * @param {Integer} cbPin 
     * @param {Pointer<Integer>} pbPinPolicy 
     * @param {Integer} cbPinPolicy 
     * @param {TPMVSC_ATTESTATION_TYPE} attestationType 
     * @param {BOOL} fGenerate 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @returns {PWSTR} 
     */
    CreateVirtualSmartCardWithAttestation(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, attestationType, fGenerate, pStatusCallback) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        pbAdminKeyMarshal := pbAdminKey is VarRef ? "char*" : "ptr"
        pbAdminKcvMarshal := pbAdminKcv is VarRef ? "char*" : "ptr"
        pbPukMarshal := pbPuk is VarRef ? "char*" : "ptr"
        pbPinMarshal := pbPin is VarRef ? "char*" : "ptr"
        pbPinPolicyMarshal := pbPinPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pszFriendlyName, "char", bAdminAlgId, pbAdminKeyMarshal, pbAdminKey, "uint", cbAdminKey, pbAdminKcvMarshal, pbAdminKcv, "uint", cbAdminKcv, pbPukMarshal, pbPuk, "uint", cbPuk, pbPinMarshal, pbPin, "uint", cbPin, pbPinPolicyMarshal, pbPinPolicy, "uint", cbPinPolicy, TPMVSC_ATTESTATION_TYPE, attestationType, BOOL, fGenerate, "ptr", pStatusCallback, PWSTR.Ptr, &ppszInstanceId := 0, "HRESULT")
        return ppszInstanceId
    }

    Query(iid) {
        if (ITpmVirtualSmartCardManager3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVirtualSmartCardWithAttestation := CallbackCreate(GetMethod(implObj, "CreateVirtualSmartCardWithAttestation"), flags, 17)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVirtualSmartCardWithAttestation)
    }
}
