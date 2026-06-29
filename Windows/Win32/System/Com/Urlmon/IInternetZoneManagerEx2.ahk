#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ZONEATTRIBUTES.ahk" { ZONEATTRIBUTES }
#Import ".\IInternetZoneManagerEx.ahk" { IInternetZoneManagerEx }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetZoneManagerEx2 extends IInternetZoneManagerEx {
    /**
     * The interface identifier for IInternetZoneManagerEx2
     * @type {Guid}
     */
    static IID := Guid("{edc17559-dd5d-4846-8eef-8becba5a4abf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetZoneManagerEx2 interfaces
    */
    struct Vtbl extends IInternetZoneManagerEx.Vtbl {
        GetZoneAttributesEx  : IntPtr
        GetZoneSecurityState : IntPtr
        GetIESecurityState   : IntPtr
        FixUnsecureSettings  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetZoneManagerEx2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    GetZoneAttributesEx(dwZone, pZoneAttributes, dwFlags) {
        result := ComCall(17, this, "uint", dwZone, ZONEATTRIBUTES.Ptr, pZoneAttributes, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZoneIndex 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<Integer>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @returns {HRESULT} 
     */
    GetZoneSecurityState(dwZoneIndex, fRespectPolicy, pdwState, pfPolicyEncountered) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pfPolicyEncounteredMarshal := pfPolicyEncountered is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "uint", dwZoneIndex, BOOL, fRespectPolicy, pdwStateMarshal, pdwState, pfPolicyEncounteredMarshal, pfPolicyEncountered, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRespectPolicy 
     * @param {Pointer<Integer>} pdwState 
     * @param {Pointer<BOOL>} pfPolicyEncountered 
     * @param {BOOL} fNoCache 
     * @returns {HRESULT} 
     */
    GetIESecurityState(fRespectPolicy, pdwState, pfPolicyEncountered, fNoCache) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"
        pfPolicyEncounteredMarshal := pfPolicyEncountered is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, BOOL, fRespectPolicy, pdwStateMarshal, pdwState, pfPolicyEncounteredMarshal, pfPolicyEncountered, BOOL, fNoCache, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FixUnsecureSettings() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetZoneManagerEx2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetZoneAttributesEx := CallbackCreate(GetMethod(implObj, "GetZoneAttributesEx"), flags, 4)
        this.vtbl.GetZoneSecurityState := CallbackCreate(GetMethod(implObj, "GetZoneSecurityState"), flags, 5)
        this.vtbl.GetIESecurityState := CallbackCreate(GetMethod(implObj, "GetIESecurityState"), flags, 5)
        this.vtbl.FixUnsecureSettings := CallbackCreate(GetMethod(implObj, "FixUnsecureSettings"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetZoneAttributesEx)
        CallbackFree(this.vtbl.GetZoneSecurityState)
        CallbackFree(this.vtbl.GetIESecurityState)
        CallbackFree(this.vtbl.FixUnsecureSettings)
    }
}
