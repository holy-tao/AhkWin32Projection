#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVssAdmin.ahk" { IVssAdmin }

/**
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssAdminEx extends IVssAdmin {
    /**
     * The interface identifier for IVssAdminEx
     * @type {Guid}
     */
    static IID := Guid("{7858a9f8-b1fa-41a6-964f-b9b36b8cd8d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssAdminEx interfaces
    */
    struct Vtbl extends IVssAdmin.Vtbl {
        GetProviderCapability : IntPtr
        GetProviderContext    : IntPtr
        SetProviderContext    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssAdminEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Guid} pProviderId 
     * @returns {Integer} 
     */
    GetProviderCapability(pProviderId) {
        result := ComCall(7, this, Guid, pProviderId, "uint*", &pllOriginalCapabilityMask := 0, "HRESULT")
        return pllOriginalCapabilityMask
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @returns {Integer} 
     */
    GetProviderContext(ProviderId) {
        result := ComCall(8, this, Guid, ProviderId, "int*", &plContext := 0, "HRESULT")
        return plContext
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     */
    SetProviderContext(ProviderId, lContext) {
        result := ComCall(9, this, Guid, ProviderId, "int", lContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVssAdminEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProviderCapability := CallbackCreate(GetMethod(implObj, "GetProviderCapability"), flags, 3)
        this.vtbl.GetProviderContext := CallbackCreate(GetMethod(implObj, "GetProviderContext"), flags, 3)
        this.vtbl.SetProviderContext := CallbackCreate(GetMethod(implObj, "SetProviderContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProviderCapability)
        CallbackFree(this.vtbl.GetProviderContext)
        CallbackFree(this.vtbl.SetProviderContext)
    }
}
