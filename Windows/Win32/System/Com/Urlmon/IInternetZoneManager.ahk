#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ZONEATTRIBUTES.ahk" { ZONEATTRIBUTES }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\URLZONEREG.ahk" { URLZONEREG }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetZoneManager extends IUnknown {
    /**
     * The interface identifier for IInternetZoneManager
     * @type {Guid}
     */
    static IID := Guid("{79eac9ef-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetZoneManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetZoneAttributes          : IntPtr
        SetZoneAttributes          : IntPtr
        GetZoneCustomPolicy        : IntPtr
        SetZoneCustomPolicy        : IntPtr
        GetZoneActionPolicy        : IntPtr
        SetZoneActionPolicy        : IntPtr
        PromptAction               : IntPtr
        LogAction                  : IntPtr
        CreateZoneEnumerator       : IntPtr
        GetZoneAt                  : IntPtr
        DestroyZoneEnumerator      : IntPtr
        CopyTemplatePoliciesToZone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetZoneManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    GetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(3, this, "uint", dwZone, ZONEATTRIBUTES.Ptr, pZoneAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    SetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(4, this, "uint", dwZone, ZONEATTRIBUTES.Ptr, pZoneAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @returns {HRESULT} 
     */
    GetZoneCustomPolicy(dwZone, guidKey, ppPolicy, pcbPolicy, _urlZoneReg) {
        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwZone, Guid.Ptr, guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, URLZONEREG, _urlZoneReg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneCustomPolicy(dwZone, guidKey, pPolicy, cbPolicy, _urlZoneReg) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", dwZone, Guid.Ptr, guidKey, pPolicyMarshal, pPolicy, "uint", cbPolicy, URLZONEREG, _urlZoneReg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @returns {Integer} 
     */
    GetZoneActionPolicy(dwZone, dwAction, cbPolicy, _urlZoneReg) {
        result := ComCall(7, this, "uint", dwZone, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, URLZONEREG, _urlZoneReg, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {URLZONEREG} _urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicy(dwZone, dwAction, pPolicy, cbPolicy, _urlZoneReg) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", dwZone, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, URLZONEREG, _urlZoneReg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAction 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pwszUrl 
     * @param {PWSTR} pwszText 
     * @param {Integer} dwPromptFlags 
     * @returns {HRESULT} 
     */
    PromptAction(dwAction, hwndParent, pwszUrl, pwszText, dwPromptFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(9, this, "uint", dwAction, HWND, hwndParent, "ptr", pwszUrl, "ptr", pwszText, "uint", dwPromptFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAction 
     * @param {PWSTR} pwszUrl 
     * @param {PWSTR} pwszText 
     * @param {Integer} dwLogFlags 
     * @returns {HRESULT} 
     */
    LogAction(dwAction, pwszUrl, pwszText, dwLogFlags) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(10, this, "uint", dwAction, "ptr", pwszUrl, "ptr", pwszText, "uint", dwLogFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwEnum 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CreateZoneEnumerator(pdwEnum, pdwCount, dwFlags) {
        pdwEnumMarshal := pdwEnum is VarRef ? "uint*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwEnumMarshal, pdwEnum, pdwCountMarshal, pdwCount, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEnum 
     * @param {Integer} dwIndex 
     * @returns {Integer} 
     */
    GetZoneAt(dwEnum, dwIndex) {
        result := ComCall(12, this, "uint", dwEnum, "uint", dwIndex, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * 
     * @param {Integer} dwEnum 
     * @returns {HRESULT} 
     */
    DestroyZoneEnumerator(dwEnum) {
        result := ComCall(13, this, "uint", dwEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTemplate 
     * @param {Integer} dwZone 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    CopyTemplatePoliciesToZone(dwTemplate, dwZone, dwReserved) {
        result := ComCall(14, this, "uint", dwTemplate, "uint", dwZone, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetZoneManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetZoneAttributes := CallbackCreate(GetMethod(implObj, "GetZoneAttributes"), flags, 3)
        this.vtbl.SetZoneAttributes := CallbackCreate(GetMethod(implObj, "SetZoneAttributes"), flags, 3)
        this.vtbl.GetZoneCustomPolicy := CallbackCreate(GetMethod(implObj, "GetZoneCustomPolicy"), flags, 6)
        this.vtbl.SetZoneCustomPolicy := CallbackCreate(GetMethod(implObj, "SetZoneCustomPolicy"), flags, 6)
        this.vtbl.GetZoneActionPolicy := CallbackCreate(GetMethod(implObj, "GetZoneActionPolicy"), flags, 6)
        this.vtbl.SetZoneActionPolicy := CallbackCreate(GetMethod(implObj, "SetZoneActionPolicy"), flags, 6)
        this.vtbl.PromptAction := CallbackCreate(GetMethod(implObj, "PromptAction"), flags, 6)
        this.vtbl.LogAction := CallbackCreate(GetMethod(implObj, "LogAction"), flags, 5)
        this.vtbl.CreateZoneEnumerator := CallbackCreate(GetMethod(implObj, "CreateZoneEnumerator"), flags, 4)
        this.vtbl.GetZoneAt := CallbackCreate(GetMethod(implObj, "GetZoneAt"), flags, 4)
        this.vtbl.DestroyZoneEnumerator := CallbackCreate(GetMethod(implObj, "DestroyZoneEnumerator"), flags, 2)
        this.vtbl.CopyTemplatePoliciesToZone := CallbackCreate(GetMethod(implObj, "CopyTemplatePoliciesToZone"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetZoneAttributes)
        CallbackFree(this.vtbl.SetZoneAttributes)
        CallbackFree(this.vtbl.GetZoneCustomPolicy)
        CallbackFree(this.vtbl.SetZoneCustomPolicy)
        CallbackFree(this.vtbl.GetZoneActionPolicy)
        CallbackFree(this.vtbl.SetZoneActionPolicy)
        CallbackFree(this.vtbl.PromptAction)
        CallbackFree(this.vtbl.LogAction)
        CallbackFree(this.vtbl.CreateZoneEnumerator)
        CallbackFree(this.vtbl.GetZoneAt)
        CallbackFree(this.vtbl.DestroyZoneEnumerator)
        CallbackFree(this.vtbl.CopyTemplatePoliciesToZone)
    }
}
