#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetZoneManager extends IUnknown{
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
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    GetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(3, this, "uint", dwZone, "ptr", pZoneAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<ZONEATTRIBUTES>} pZoneAttributes 
     * @returns {HRESULT} 
     */
    SetZoneAttributes(dwZone, pZoneAttributes) {
        result := ComCall(4, this, "uint", dwZone, "ptr", pZoneAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} ppPolicy 
     * @param {Pointer<UInt32>} pcbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    GetZoneCustomPolicy(dwZone, guidKey, ppPolicy, pcbPolicy, urlZoneReg) {
        result := ComCall(5, this, "uint", dwZone, "ptr", guidKey, "char*", ppPolicy, "uint*", pcbPolicy, "int", urlZoneReg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Pointer<Guid>} guidKey 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneCustomPolicy(dwZone, guidKey, pPolicy, cbPolicy, urlZoneReg) {
        result := ComCall(6, this, "uint", dwZone, "ptr", guidKey, "char*", pPolicy, "uint", cbPolicy, "int", urlZoneReg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    GetZoneActionPolicy(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg) {
        result := ComCall(7, this, "uint", dwZone, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "int", urlZoneReg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwZone 
     * @param {Integer} dwAction 
     * @param {Pointer<Byte>} pPolicy 
     * @param {Integer} cbPolicy 
     * @param {Integer} urlZoneReg 
     * @returns {HRESULT} 
     */
    SetZoneActionPolicy(dwZone, dwAction, pPolicy, cbPolicy, urlZoneReg) {
        result := ComCall(8, this, "uint", dwZone, "uint", dwAction, "char*", pPolicy, "uint", cbPolicy, "int", urlZoneReg, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(9, this, "uint", dwAction, "ptr", hwndParent, "ptr", pwszUrl, "ptr", pwszText, "uint", dwPromptFlags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(10, this, "uint", dwAction, "ptr", pwszUrl, "ptr", pwszText, "uint", dwLogFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwEnum 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CreateZoneEnumerator(pdwEnum, pdwCount, dwFlags) {
        result := ComCall(11, this, "uint*", pdwEnum, "uint*", pdwCount, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEnum 
     * @param {Integer} dwIndex 
     * @param {Pointer<UInt32>} pdwZone 
     * @returns {HRESULT} 
     */
    GetZoneAt(dwEnum, dwIndex, pdwZone) {
        result := ComCall(12, this, "uint", dwEnum, "uint", dwIndex, "uint*", pdwZone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEnum 
     * @returns {HRESULT} 
     */
    DestroyZoneEnumerator(dwEnum) {
        result := ComCall(13, this, "uint", dwEnum, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(14, this, "uint", dwTemplate, "uint", dwZone, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
