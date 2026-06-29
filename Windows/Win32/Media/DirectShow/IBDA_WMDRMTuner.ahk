#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_WMDRMTuner extends IUnknown {
    /**
     * The interface identifier for IBDA_WMDRMTuner
     * @type {Guid}
     */
    static IID := Guid("{86d979cf-a8a7-4f94-b5fb-14c0aca68fe6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_WMDRMTuner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PurchaseEntitlement : IntPtr
        CancelCaptureToken  : IntPtr
        SetPidProtection    : IntPtr
        GetPidProtection    : IntPtr
        SetSyncValue        : IntPtr
        GetStartCodeProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_WMDRMTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} ulPurchaseTokenLen 
     * @param {Pointer<Integer>} pbPurchaseToken 
     * @param {Pointer<Integer>} pulCaptureTokenLen 
     * @param {Pointer<Integer>} pbCaptureToken 
     * @returns {Integer} 
     */
    PurchaseEntitlement(ulDialogRequest, bstrLanguage, ulPurchaseTokenLen, pbPurchaseToken, pulCaptureTokenLen, pbCaptureToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        pbPurchaseTokenMarshal := pbPurchaseToken is VarRef ? "char*" : "ptr"
        pulCaptureTokenLenMarshal := pulCaptureTokenLen is VarRef ? "uint*" : "ptr"
        pbCaptureTokenMarshal := pbCaptureToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulDialogRequest, BSTR, bstrLanguage, "uint", ulPurchaseTokenLen, pbPurchaseTokenMarshal, pbPurchaseToken, "uint*", &pulDescrambleStatus := 0, pulCaptureTokenLenMarshal, pulCaptureTokenLen, pbCaptureTokenMarshal, pbCaptureToken, "HRESULT")
        return pulDescrambleStatus
    }

    /**
     * 
     * @param {Integer} ulCaptureTokenLen 
     * @param {Pointer<Integer>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    CancelCaptureToken(ulCaptureTokenLen, pbCaptureToken) {
        pbCaptureTokenMarshal := pbCaptureToken is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulCaptureTokenLen, pbCaptureTokenMarshal, pbCaptureToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPid 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    SetPidProtection(ulPid, uuidKey) {
        result := ComCall(5, this, "uint", ulPid, Guid.Ptr, uuidKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pulPid 
     * @returns {Guid} 
     */
    GetPidProtection(pulPid) {
        uuidKey := Guid()
        result := ComCall(6, this, "uint", pulPid, Guid.Ptr, uuidKey, "HRESULT")
        return uuidKey
    }

    /**
     * 
     * @param {Integer} ulSyncValue 
     * @returns {HRESULT} 
     */
    SetSyncValue(ulSyncValue) {
        result := ComCall(7, this, "uint", ulSyncValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStartCodeProfileLen 
     * @param {Pointer<Integer>} pbStartCodeProfile 
     * @returns {HRESULT} 
     */
    GetStartCodeProfile(pulStartCodeProfileLen, pbStartCodeProfile) {
        pulStartCodeProfileLenMarshal := pulStartCodeProfileLen is VarRef ? "uint*" : "ptr"
        pbStartCodeProfileMarshal := pbStartCodeProfile is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pulStartCodeProfileLenMarshal, pulStartCodeProfileLen, pbStartCodeProfileMarshal, pbStartCodeProfile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_WMDRMTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PurchaseEntitlement := CallbackCreate(GetMethod(implObj, "PurchaseEntitlement"), flags, 8)
        this.vtbl.CancelCaptureToken := CallbackCreate(GetMethod(implObj, "CancelCaptureToken"), flags, 3)
        this.vtbl.SetPidProtection := CallbackCreate(GetMethod(implObj, "SetPidProtection"), flags, 3)
        this.vtbl.GetPidProtection := CallbackCreate(GetMethod(implObj, "GetPidProtection"), flags, 3)
        this.vtbl.SetSyncValue := CallbackCreate(GetMethod(implObj, "SetSyncValue"), flags, 2)
        this.vtbl.GetStartCodeProfile := CallbackCreate(GetMethod(implObj, "GetStartCodeProfile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PurchaseEntitlement)
        CallbackFree(this.vtbl.CancelCaptureToken)
        CallbackFree(this.vtbl.SetPidProtection)
        CallbackFree(this.vtbl.GetPidProtection)
        CallbackFree(this.vtbl.SetSyncValue)
        CallbackFree(this.vtbl.GetStartCodeProfile)
    }
}
