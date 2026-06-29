#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInternetZoneManager.ahk" { IInternetZoneManager }
#Import ".\URLZONEREG.ahk" { URLZONEREG }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetZoneManagerEx extends IInternetZoneManager {
    /**
     * The interface identifier for IInternetZoneManagerEx
     * @type {Guid}
     */
    static IID := Guid("{a4c23339-8e06-431e-9bf4-7e711c085648}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetZoneManagerEx interfaces
    */
    struct Vtbl extends IInternetZoneManager.Vtbl {
        GetZoneActionPolicyEx : IntPtr
        SetZoneActionPolicyEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetZoneManagerEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    GetZoneActionPolicyEx(dwZone, dwAction, cbPolicy, _urlZoneReg, dwFlags) {
        result := ComCall(15, this, "uint", dwZone, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, URLZONEREG, _urlZoneReg, "uint", dwFlags, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicyEx(dwZone, dwAction, pPolicy, cbPolicy, _urlZoneReg, dwFlags) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "uint", dwZone, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, URLZONEREG, _urlZoneReg, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetZoneManagerEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetZoneActionPolicyEx := CallbackCreate(GetMethod(implObj, "GetZoneActionPolicyEx"), flags, 7)
        this.vtbl.SetZoneActionPolicyEx := CallbackCreate(GetMethod(implObj, "SetZoneActionPolicyEx"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetZoneActionPolicyEx)
        CallbackFree(this.vtbl.SetZoneActionPolicyEx)
    }
}
