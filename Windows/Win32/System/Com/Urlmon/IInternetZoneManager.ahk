#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetZoneManager
     * @type {Guid}
     */
    static IID => Guid("{79eac9ef-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetZoneAttributes", "SetZoneAttributes", "GetZoneCustomPolicy", "SetZoneCustomPolicy", "GetZoneActionPolicy", "SetZoneActionPolicy", "PromptAction", "LogAction", "CreateZoneEnumerator", "GetZoneAt", "DestroyZoneEnumerator", "CopyTemplatePoliciesToZone"]

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    GetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(3, this, "uint", dwZone, "ptr", pZoneAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    SetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(4, this, "uint", dwZone, "ptr", pZoneAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Pointer<Integer>>} ppPolicy 
     * @param {Pointer<Integer>} pcbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    GetZoneCustomPolicy(dwZone, guidKey, ppPolicy, pcbPolicy, urlZoneReg) {
        ppPolicyMarshal := ppPolicy is VarRef ? "ptr*" : "ptr"
        pcbPolicyMarshal := pcbPolicy is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwZone, "ptr", guidKey, ppPolicyMarshal, ppPolicy, pcbPolicyMarshal, pcbPolicy, "int", urlZoneReg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneCustomPolicy(dwZone, guidKey, pPolicy, cbPolicy, urlZoneReg) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", dwZone, "ptr", guidKey, pPolicyMarshal, pPolicy, "uint", cbPolicy, "int", urlZoneReg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {Integer} 
     */
    GetZoneActionPolicy(dwZone, dwAction, cbPolicy, urlZoneReg) {
        result := ComCall(7, this, "uint", dwZone, "uint", dwAction, "char*", &pPolicy := 0, "uint", cbPolicy, "int", urlZoneReg, "HRESULT")
        return pPolicy
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicy(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg) {
        pPolicyMarshal := pPolicy is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", dwZone, "uint", dwAction, pPolicyMarshal, pPolicy, "uint", cbPolicy, "int", urlZoneReg, "HRESULT")
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
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(9, this, "uint", dwAction, "ptr", hwndParent, "ptr", pwszUrl, "ptr", pwszText, "uint", dwPromptFlags, "HRESULT")
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
}
