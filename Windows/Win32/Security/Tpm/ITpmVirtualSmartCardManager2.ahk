#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITpmVirtualSmartCardManager.ahk" { ITpmVirtualSmartCardManager }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITpmVirtualSmartCardManagerStatusCallback.ahk" { ITpmVirtualSmartCardManagerStatusCallback }

/**
 * @namespace Windows.Win32.Security.Tpm
 */
export default struct ITpmVirtualSmartCardManager2 extends ITpmVirtualSmartCardManager {
    /**
     * The interface identifier for ITpmVirtualSmartCardManager2
     * @type {Guid}
     */
    static IID := Guid("{fdf8a2b9-02de-47f4-bc26-aa85ab5e5267}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITpmVirtualSmartCardManager2 interfaces
    */
    struct Vtbl extends ITpmVirtualSmartCardManager.Vtbl {
        CreateVirtualSmartCardWithPinPolicy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITpmVirtualSmartCardManager2.Vtbl()
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
     * @param {BOOL} fGenerate 
     * @param {ITpmVirtualSmartCardManagerStatusCallback} pStatusCallback 
     * @param {Pointer<PWSTR>} ppszInstanceId 
     * @param {Pointer<BOOL>} pfNeedReboot 
     * @returns {HRESULT} 
     */
    CreateVirtualSmartCardWithPinPolicy(pszFriendlyName, bAdminAlgId, pbAdminKey, cbAdminKey, pbAdminKcv, cbAdminKcv, pbPuk, cbPuk, pbPin, cbPin, pbPinPolicy, cbPinPolicy, fGenerate, pStatusCallback, ppszInstanceId, pfNeedReboot) {
        pszFriendlyName := pszFriendlyName is String ? StrPtr(pszFriendlyName) : pszFriendlyName

        pbAdminKeyMarshal := pbAdminKey is VarRef ? "char*" : "ptr"
        pbAdminKcvMarshal := pbAdminKcv is VarRef ? "char*" : "ptr"
        pbPukMarshal := pbPuk is VarRef ? "char*" : "ptr"
        pbPinMarshal := pbPin is VarRef ? "char*" : "ptr"
        pbPinPolicyMarshal := pbPinPolicy is VarRef ? "char*" : "ptr"
        ppszInstanceIdMarshal := ppszInstanceId is VarRef ? "ptr*" : "ptr"
        pfNeedRebootMarshal := pfNeedReboot is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pszFriendlyName, "char", bAdminAlgId, pbAdminKeyMarshal, pbAdminKey, "uint", cbAdminKey, pbAdminKcvMarshal, pbAdminKcv, "uint", cbAdminKcv, pbPukMarshal, pbPuk, "uint", cbPuk, pbPinMarshal, pbPin, "uint", cbPin, pbPinPolicyMarshal, pbPinPolicy, "uint", cbPinPolicy, BOOL, fGenerate, "ptr", pStatusCallback, ppszInstanceIdMarshal, ppszInstanceId, pfNeedRebootMarshal, pfNeedReboot, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITpmVirtualSmartCardManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVirtualSmartCardWithPinPolicy := CallbackCreate(GetMethod(implObj, "CreateVirtualSmartCardWithPinPolicy"), flags, 17)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVirtualSmartCardWithPinPolicy)
    }
}
